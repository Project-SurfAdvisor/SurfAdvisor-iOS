//
//  DeatilVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 21..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit
enum level {
    
}
class DetailVC: UIViewController {
    
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var gradeLbl: UILabel!
    
    @IBOutlet weak var infoTab: UIImageView!
    @IBOutlet weak var forcastTab: UIImageView!
    
    // 지역 날씨
    @IBOutlet weak var forcastView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var waveLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var ridingLbl: UILabel!
    @IBOutlet weak var wearLbl: UILabel!
    @IBOutlet weak var levelLbl: UILabel!
    
    // 지역 정보
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var surfShopCV: UICollectionView!
    @IBOutlet weak var restaurantCV: UICollectionView!
    @IBOutlet weak var hotelCV: UICollectionView!
    @IBOutlet weak var forcastTbV: UITableView!
    
    var grade = 0
    let grades = ["☆", "★", "★★", "★★★", "★★★★", "★★★★★"]
    let waves = ["매우 낮은 파도" , "낮은 파도" , "보통 높이의 파도" , "높은 파도" , "매우 높은 파도"]
    let winds = ["강한 온쇼어","보통 세기의 온쇼어","약한 온쇼어","사이드쇼어","약한 오프쇼어","보통 세기의 오프쇼어","강한 오프쇼어"]
    let ridings = ["매우 짧은 라이딩","짧은 라이딩","보통길이의 라이딩","긴 라이딩","매우 긴 라이딩"]
    let wears = ["7mm full suit","6mm full suit","5mm full suit","4mm full suit","3mm full suit","2mm spring suit","1mm jacket","lashguard"]
    
    var dateObj = Date()
    var areaName: String = ""
    var areaId = 0
    var date = ""
    var area: Area? {
        didSet{
            self.forcastTbV.reloadData()
        }
    }
    
    var areaInfo: Info? {
        didSet{
            self.surfShopCV.reloadData()
            self.restaurantCV.reloadData()
            self.hotelCV.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initData()
        setupDate()
        print(areaId)
    }
    
    private func initData() {
        self.areaNameLabel.text = areaName
        AreaDetailService.shareInstance.getAreaDetail(date: self.date, id: self.areaId, completion: { (area) in
            self.area = area
            self.waveLbl.text = self.waves[area.siWave]
            self.windLbl.text = self.winds[area.siWind]
            self.ridingLbl.text = self.ridings[area.siRiding]
            self.wearLbl.text = self.wears[area.siWear-2]
            if area.siGradeComment == "초급자" {
                self.levelLbl.text = "Beginner"
            } else if area.siGradeComment == "중급자" {
                self.levelLbl.text = "Intermediate"
            } else {
                self.levelLbl.text = "Experts"
            }
        }) { (err) in
            print("detail 에러")
        }
        
        AreaInfoService.shareInstance.getAreaInfo(id: self.areaId, completion: { (info) in
            self.areaInfo = info
        }) { (err) in
            print("info 에러")
        }
    }
    
    private func setupDate() {
        let dateFommatter = DateFormatter()
        dateFommatter.dateFormat = "yyyy . MM . dd"
        self.dateLabel.text = dateFommatter.string(from: self.dateObj)
    }
    
    private func setupView() {
        gradeLbl.text = grades[grade]
        infoTab.isHidden = true
        infoView.isHidden = true
        surfShopCV.delegate = self
        surfShopCV.dataSource = self
        restaurantCV.delegate = self
        restaurantCV.dataSource = self
        hotelCV.delegate = self
        hotelCV.dataSource = self
        
        forcastTbV.delegate = self
        forcastTbV.dataSource = self
    }
    
    @IBAction func forcastAction(_ sender: UIButton) {
        forcastTab.isHidden = false
        infoTab.isHidden = true
        forcastView.isHidden = false
        infoView.isHidden = true
    }
    
    @IBAction func infoAction(_ sender: UIButton) {
        forcastTab.isHidden = true
        infoTab.isHidden = false
        forcastView.isHidden = true
        infoView.isHidden = false
    }
    
    @IBAction func moreAction(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoDetailVC") as! InfoDetailVC
        vc.category = sender.tag
        vc.id = self.areaId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = forcastTbV.dequeueReusableCell(withIdentifier: "ForcastCell") as! ForcastCell
        guard let area = self.area else {return cell}
        let forcast = area.forcast[indexPath.row]
        
        if forcast.sidTime < 10 {
            cell.timeLbl.text = "0\(forcast.sidTime) : 00"
        } else {
            cell.timeLbl.text = "\(forcast.sidTime) : 00"
        }
        cell.gradeLbl.text = "\(grades[Int(forcast.sidGradeStar)])"
        cell.waveLbl.text = "\(forcast.sidWave)"
        return cell
    }
}

extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let info = areaInfo else {return 0}
        
        if collectionView == surfShopCV {
            print(info.surfShopList.count)
            return info.surfShopList.count < 6 ? info.surfShopList.count : 6
        } else if collectionView == restaurantCV {
            print(info.restaurantList.count)
            return info.restaurantList.count < 6 ? info.restaurantList.count : 6
        } else {
            print(info.hotelList.count)
            return info.hotelList.count < 6 ? info.hotelList.count : 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == surfShopCV {
            let surfShop = areaInfo!.surfShopList[indexPath.item]
            let cell = surfShopCV.dequeueReusableCell(withReuseIdentifier: "SurfShopCell", for: indexPath) as! SurfShopCell
            cell.nameLabel.text = surfShop.ssName
            cell.imageView.imageFromUrl(surfShop.ssPhoto, defaultImgPath: "noImage")
            cell.imageView.applyRadius(radius: 6)
            return cell
            
        } else if collectionView == restaurantCV {
            let restaurant = areaInfo!.restaurantList[indexPath.item]
            let cell = restaurantCV.dequeueReusableCell(withReuseIdentifier: "RestaurantCell", for: indexPath) as! SurfShopCell
            cell.nameLabel.text = restaurant.rName
            cell.imageView.imageFromUrl(restaurant.rPhoto, defaultImgPath: "noImage")
            cell.imageView.applyRadius(radius: 6)
            return cell
            
        } else  {
            let hotel = areaInfo!.hotelList[indexPath.item]
            let cell = hotelCV.dequeueReusableCell(withReuseIdentifier: "HotelCell", for: indexPath) as! SurfShopCell
            cell.nameLabel.text = hotel.hName
            cell.imageView.imageFromUrl(hotel.hPhoto, defaultImgPath: "noImage")
            cell.imageView.applyRadius(radius: 6)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoDetailVC") as! InfoDetailVC
       
        vc.id = self.areaId
        if collectionView == surfShopCV {
             vc.category = 1
        } else if collectionView == restaurantCV {
             vc.category = 2
        } else if collectionView == hotelCV {
             vc.category = 3
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
