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
    @IBOutlet weak var callBtn: UIButton!
    
    var phoneNum: String = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        if phoneNum == "-" {
            callBtn.isHidden = true
        }
        squareView.applyRadius(radius: 7)
        infoImageView.applyRadius(radius: 7)
        infoImageView.applyBorder(width: 1.0, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    }
    

//    @IBAction func callAction(_ sender: UIButton) {
//        guard let url = URL(string: "telprompt://\(phoneNum)") else {
//            return
//        }
//        print("Dfd")
//        self.inputViewController?.simpleAlertWithCompletion(title: phoneNum, message: "", okCompletion: { (UIAlertAction) in
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }, cancelCompletion: nil)
//    }
}
