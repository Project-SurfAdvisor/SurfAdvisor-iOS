//
//  RestaurantCell.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 11. 12..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var callBtn: UIButton!
    var restaurantLoc: Location!
    var phoneNum: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if phoneNum == "-" {
            callBtn.isHidden = true
        }
        infoImageView.applyBorder(width: 1.0, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        squareView.applyRadius(radius: 7)
        infoImageView.applyRadius(radius: 7)
    }
    @IBAction func mapAction(_ sender: Any) {
        goToKaKaoMapApp(loc: restaurantLoc)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
