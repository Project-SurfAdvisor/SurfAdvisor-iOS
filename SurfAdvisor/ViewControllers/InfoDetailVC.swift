//
//  InfoDetailVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 22..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class InfoDetailVC: UIViewController {

    @IBOutlet weak var categoryLbl: UILabel!
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
            self.categoryLbl.text = "Surf Shop"
        }
        else if category == 2 {
            self.categoryLbl.text = "Restaurant"
        } else if category == 3 {
            self.categoryLbl.text = "Hotel"
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
    
    @objc func callAction(btn: UIButton) {
        guard let numberString = btn.titleLabel?.text,
            let url = URL(string: "telprompt://\(numberString)") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
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
        if category == 1 {
            let cell = infoTbV.dequeueReusableCell(withIdentifier: "SurfShopInfoCell") as! SurfShopInfoCell
            guard let surfShop = self.areainfo?.surfShopList[indexPath.row] else {return cell}
            cell.nameLabel.text = surfShop.ssName
            cell.addressLabel.text = surfShop.ssAddress
            cell.siteLabel.text = surfShop.ssSite
            cell.introductionLabel.text = surfShop.ssIntroduction
            cell.timeLabel.text = surfShop.ssTime
            cell.infoImageView.imageFromUrl(surfShop.ssPhoto, defaultImgPath: "noImage")
            if surfShop.ssPhoneNumber == "-" {
                cell.callBtn.isHidden = true
            } else {
                cell.callBtn.setTitle(surfShop.ssPhoneNumber, for: .normal)
                cell.callBtn.addTarget(self, action: #selector(callAction(btn:)), for: .touchUpInside)
                
            }
            return cell
        } else if category == 2 {
            let cell = infoTbV.dequeueReusableCell(withIdentifier: "RestaurantInfoCell") as! RestaurantCell
            guard let restaurant = self.areainfo?.restaurantList[indexPath.row] else {return cell }
            cell.nameLabel.text = restaurant.rName
            cell.addressLabel.text = restaurant.rAddress
            cell.introductionLabel.text = restaurant.rExplain1 + restaurant.rExplain2
            cell.timeLabel.text = restaurant.rTime
            cell.infoImageView.imageFromUrl(restaurant.rPhoto, defaultImgPath: "noImage")
            if restaurant.rPhoneNumber == "-" {
                cell.callBtn.isHidden = true
            } else {
                cell.callBtn.setTitle(restaurant.rPhoneNumber, for: .normal)
                cell.callBtn.addTarget(self, action: #selector(callAction(btn:)), for: .touchUpInside)
            }
            return cell
        } else {
            let cell = infoTbV.dequeueReusableCell(withIdentifier: "HotelInfoCell") as! HotelCell
            guard let hotel = self.areainfo?.hotelList[indexPath.row] else {return cell }
            cell.nameLabel.text = hotel.hName
            cell.addressLabel.text = hotel.hAddress
            cell.infoImageView.imageFromUrl(hotel.hPhoto, defaultImgPath: "noImage")
            if hotel.hPhoneNumber == "-" {
                cell.callBtn.isHidden = true
            } else {
                cell.callBtn.setTitle(hotel.hPhoneNumber, for: .normal)
                cell.callBtn.addTarget(self, action: #selector(callAction(btn:)), for: .touchUpInside)
            }
            return cell
        }
    }
}
