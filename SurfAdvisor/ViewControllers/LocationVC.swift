//
//  LocationVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 21..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class LocationVC: UIViewController {

    @IBOutlet weak var locationTbV: UITableView!
    
    var cityArr = [City]() {
        didSet {
            locationTbV.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initData()
    }
    
    private func setupView(){
        self.locationTbV.delegate = self
        self.locationTbV.dataSource = self
    }

    private func initData(){
        CityListService.shareInstance.getCityList(completion: { (city) in
            self.cityArr = city
        }) { (err) in
            print("city list err")
        }
    }

    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true) {
            
        }
    }
    
}

extension LocationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationTbV.dequeueReusableCell(withIdentifier: "CityListCell") as! CityListCell
        cell.nameLabel.text = self.cityArr[indexPath.row].cName
        return cell
    }
    
    
    
}
