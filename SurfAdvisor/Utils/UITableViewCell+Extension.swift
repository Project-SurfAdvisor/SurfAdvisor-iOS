//
//  UITableViewCell+Extension.swift
//  SurfAdvisor
//
//  Created by 박세은 on 30/12/2019.
//  Copyright © 2019 박세은. All rights reserved.
//

import UIKit
extension UITableViewCell {
    func goToKaKaoMapApp(loc: Location) {
        guard let schemeURL = URL(string:
            "kakaomap://look?p=\(loc.latitude),\(loc.longitute)"
            )else {
            
            return
        }
        if UIApplication.shared.canOpenURL(schemeURL) {
            UIApplication.shared.open(schemeURL, options: [:]) { (bool) in
                
            }
        } else {
            guard let schemeURL = URL(string:"https://apps.apple.com/kr/app/%EC%B9%B4%EC%B9%B4%EC%98%A4%EB%A7%B5-%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD-no-1-%EC%A7%80%EB%8F%84%EC%95%B1/id304608425"
                )else {
                
                return
            }
            if UIApplication.shared.canOpenURL(schemeURL) {
                UIApplication.shared.open(schemeURL, options: [:]) { (bool) in
                    
                }
            }
            
        }
        
        
    }
}
