//
//  InfoDetailCell.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 22..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class SurfShopInfoCell: UITableViewCell {

    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var siteLabel: UILabel!
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var squareView: UIView!
    
    var phoneNum: String?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func callAction(_ sender: UIButton) {
        
        
    }
}
