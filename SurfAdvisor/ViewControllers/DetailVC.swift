//
//  DeatilVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 21..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var forcastView: UIView!
    @IBOutlet weak var surfShopCV: UICollectionView!
    @IBOutlet weak var forcastTbV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        infoView.isHidden = true
    }
    
    private func setupView() {
        surfShopCV.delegate = self
        surfShopCV.dataSource = self
        
        forcastTbV.delegate = self
        forcastTbV.dataSource = self
    }
    
    @IBAction func forcastAction(_ sender: UIButton) {
        forcastView.isHidden = false
        infoView.isHidden = true
    }
    @IBAction func infoAction(_ sender: UIButton) {
        forcastView.isHidden = true
        infoView.isHidden = false
    }
    
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = forcastTbV.dequeueReusableCell(withIdentifier: "ForcastCell") as! ForcastCell
        return cell
    }
    
}

extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        if collectionView == surfShopCV {
//
//        }
        
        let cell = surfShopCV.dequeueReusableCell(withReuseIdentifier: "SurfShopCell", for: indexPath) as! SurfShopCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoDetailVC") as! InfoDetailVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
