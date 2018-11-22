//
//  SearchVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 21..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var dateTxf: UITextField!
    @IBOutlet weak var locationTxf: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var locationView: UIView!
    
    var dateObj = Date()
    var datePicker = UIDatePicker()
    var date = ""  {
        didSet {
            self.dateTxf.text = date
        }
    }
   
    var location = "" {
        didSet {
            self.locationTxf.text = location
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickerView()
        setupDate()
        setupView()
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(setLocation(noti:)), name: NSNotification.Name("setLocation"), object: nil)
        
//        let gest = UIGestureRecognizer(target: self, action: #selector(touchView(gest:)))
//        self.view.addGestureRecognizer(gest)
        
    }
//    @objc func touchView(gest: UIGestureRecognizer) {
//        self.view.endEditing(true)
//    }
    
    private func setupView(){
        dateView.applyRadius(radius: 2)
        locationView.applyRadius(radius: 2)
        searchBtn.applyRadius(radius: 4)
        
    }
    
    @objc func setLocation(noti: Notification) {
        guard let loc = noti.object as? String else {return}
        self.location = loc
    }
    
    private func setupDate() {
        let dateFommatter = DateFormatter()
        dateFommatter.dateFormat = "yyyy.MM.dd"
        date = dateFommatter.string(from: Date())
    }
    
    private func setupPickerView() {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(chooseDate))
        toolbar.setItems([doneButton], animated: true)
        dateTxf.inputAccessoryView = toolbar
        dateTxf.inputView = datePicker
    }

    @objc func chooseDate() {
        let dateFommatter = DateFormatter()
        dateFommatter.dateFormat = "yyyy.MM.dd"
        date = dateFommatter.string(from: datePicker.date)
        self.dateObj = datePicker.date
        view.endEditing(true)
    }
    
    @IBAction func locationAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LocationVC") as! LocationVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        
        if locationTxf.text == "" {
            let alertController = UIAlertController(title: "경고", message: "위치를 입력하세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            
        } else {
            let alertController = UIAlertController(title: "알림", message: "날짜(\(date))와 위치(\(location))가 맞습니까?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            let okAction = UIAlertAction(title: "확인", style: .default) { (alert) in
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
                vc.location = self.location
                vc.date = self.date
                vc.dateObj = self.dateObj
                self.navigationController?.pushViewController(vc, animated: true)
            }
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
}
