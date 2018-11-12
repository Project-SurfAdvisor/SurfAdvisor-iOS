//
//  InfoDetailVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 22..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class InfoDetailVC: UIViewController {

    @IBOutlet weak var infoTbV: UITableView!
    var areainfo: Info? {
        didSet {
            infoTbV.reloadData()
        }
    }
    var id = 0
    var category = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initData()        
    }
    
    private func setupView() {
        if category == 1 {
            self.title = "Surf Shop"
        }
        else if category == 2 {
            self.title = "Restaurant"
        } else if category == 3 {
            self.title = "Hotel"
        }
        
        self.infoTbV.delegate = self
        self.infoTbV.dataSource = self
    }
    
    private func initData() {
        AreaInfoService.shareInstance.getAreaInfo(id: self.id, completion: { (info) in
            self.areainfo = info
        }) { (err) in
            print("정보 출력 에러")
        }
    }
}

extension InfoDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let info = areainfo else {
            return 0
        }
        
        if category == 1 {
            return info.surfShopList.count
        } else if category == 2 {
            return info.restaurantList.count
        } else {
            return info.hotelList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let surfShop = self.areainfo?.surfShopList[indexPath.row]
        let cell = infoTbV.dequeueReusableCell(withIdentifier: "SurfShopInfoCell") as! SurfShopInfoCell
        cell.nameLabel.text = surfShop?.ssName
        cell.addressLabel.text = surfShop?.ssAddress
        cell.siteLabel.text = surfShop?.ssSite
        cell.introductionLabel.text = surfShop?.ssIntroduction
        cell.timeLabel.text = surfShop?.ssTime
        cell.infoImageView.imageFromUrl(surfShop?.ssPhoto, defaultImgPath: "")
        cell.phoneNum = surfShop?.ssPhoneNumber
        
        return cell
    }
}
