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
    var datePicker = UIDatePicker()
    var date = ""
    var longitude = 0.0
    var latitude = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickerView()
        
//        let gest = UIGestureRecognizer(target: self, action: #selector(touchView(gest:)))
//        self.view.addGestureRecognizer(gest)
    }
    
//    @objc func touchView(gest: UIGestureRecognizer) {
//        self.view.endEditing(true)
//    }
    
    func setupPickerView() {
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
        dateTxf.text = dateFommatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @IBAction func locationAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LocationVC") as! LocationVC
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true)
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        
        SearchResultService.shareInstance.getGradeSearchResult(date: self.date, longitude: self.longitude, latitude: self.latitude, completion: { (places) in
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
            vc.places = places
            vc.date = self.date
            vc.longitude = self.longitude
            vc.latitude = self.latitude
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (err) in
            print("검색 결과 실패")
        }
    }
    
    
}
