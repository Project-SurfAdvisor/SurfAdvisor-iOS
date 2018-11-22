//
//  AreaDetailData.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation


struct AreaDetailData: Codable {
    let status: String
    let data: Area
    let message: String
}

struct Area: Codable {
    let saName: String
    let siGradeStar: Double
    let siWave, siWind, siRiding, siWear: Int
    let siGradeComment: String
    let forcast: [Forcast]
    
    enum CodingKeys: String, CodingKey {
        case saName = "sa_name"
        case siGradeStar = "si_gradeStar"
        case siWave = "si_wave"
        case siWind = "si_wind"
        case siRiding = "si_riding"
        case siWear = "si_wear"
        case siGradeComment = "si_gradeComment"
        case forcast
    }
}

struct Forcast: Codable {
    let sidTime: Int
    let sidGradeStar,sidWave: Double
    
    enum CodingKeys: String, CodingKey {
        case sidTime = "sid_time"
        case sidWave = "sid_wave"
        case sidGradeStar = "sid_gradeStar"
    }
}
