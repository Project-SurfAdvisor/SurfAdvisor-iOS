//
//  DeatilVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 21..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var forcastView: UIView!
    
    @IBOutlet weak var surfShopCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        surfShopCV.delegate = self
        surfShopCV.dataSource = self
    }

}

extension DetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
}
