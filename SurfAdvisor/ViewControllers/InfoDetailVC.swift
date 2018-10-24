//
//  InfoDetailVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 22..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class InfoDetailVC: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var infoTbV: UITableView!
    var Areainfo: Info?
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    private func setupView() {
        if id == 2 {
            categoryLabel.text = "Restaurant"
        } else if id == 3 {
            categoryLabel.text = "Hotel"
        }
        self.infoTbV.delegate = self
        self.infoTbV.dataSource = self
    }
}

extension InfoDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let info = Areainfo else {
            return 0
        }
        
        if id == 1 {
            return info.surfShopList.count
        } else if id == 2 {
            return info.restaurantList.count
        } else {
            return info.hotelList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = infoTbV.dequeueReusableCell(withIdentifier: "InfoDetailCell") as! InfoDetailCell
        return cell
    }
    
    
}
