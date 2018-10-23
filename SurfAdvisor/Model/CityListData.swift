//
//  CityListData.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation

struct CityListData: Codable {
    let status: String
    let data: [City]
    let message: String
}

struct City: Codable {
    let cID: Int
    let cName: String
    
    enum CodingKeys: String, CodingKey {
        case cID = "c_id"
        case cName = "c_name"
    }
}

