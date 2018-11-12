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
    let siGrade: Double
    let siTemperature, siMaxTemperature, siWave, siWind: Int
    let forcast: [Forcast]
    
    enum CodingKeys: String, CodingKey {
        case saName = "sa_name"
        case siGrade = "si_grade"
        case siTemperature = "si_temperature"
        case siMaxTemperature = "si_maxTemperature"
        case siWave = "si_wave"
        case siWind = "si_wind"
        case forcast
    }
}

struct Forcast: Codable {
    let sidTime, sidWave, sidWind, sidGrade: Int
    
    enum CodingKeys: String, CodingKey {
        case sidTime = "sid_time"
        case sidWave = "sid_wave"
        case sidWind = "sid_wind"
        case sidGrade = "sid_grade"
    }
}
