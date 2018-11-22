//
//  SearchResultData.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation

struct SearchResultData: Codable {
    let status: String
    let data: [Place]
    let message: String
}

struct Place: Codable {
    let saID: Int
    let saName: String
    let siGradeStar, distance: Double
    let distanceUnit: String
    
    enum CodingKeys: String, CodingKey {
        case saID = "sa_id"
        case saName = "sa_name"
        case siGradeStar = "si_gradeStar"
        case distance, distanceUnit
    }
}
