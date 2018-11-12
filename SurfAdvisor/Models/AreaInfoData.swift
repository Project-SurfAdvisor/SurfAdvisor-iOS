//
//  InfoAreaData.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//
import Foundation

struct AreaInfoData: Codable {
    let status: String
    let data: Info
    let message: String
}

struct Info: Codable {
    let surfShopList: [SurfShopList]
    let restaurantList: [RestaurantList]
    let hotelList: [HotelList]
}

struct HotelList: Codable {
    let hName: String
    let hLongitude, hLatitude: Int
    let distance: Double
    let distanceUnit: String
    
    enum CodingKeys: String, CodingKey {
        case hName = "h_name"
        case hLongitude = "h_longitude"
        case hLatitude = "h_latitude"
        case distance, distanceUnit
    }
}


struct RestaurantList: Codable {
    let rName: String
    let rLongitude, rLatitude: Int
    let distance: Double
    let distanceUnit: String
    
    enum CodingKeys: String, CodingKey {
        case rName = "r_name"
        case rLongitude = "r_longitude"
        case rLatitude = "r_latitude"
        case distance, distanceUnit
    }
}

struct SurfShopList: Codable {
    let ssPhoto, ssName: String
    let ssSite: String
    let ssIntroduction, ssTime, ssAddress: String
    let ssLongitude, ssLatitude: Int
    let ssPhoneNumber: String
    let distance: Double
    let distanceUnit: String
    
    enum CodingKeys: String, CodingKey {
        case ssPhoto = "ss_photo"
        case ssName = "ss_name"
        case ssSite = "ss_site"
        case ssIntroduction = "ss_introduction"
        case ssTime = "ss_time"
        case ssAddress = "ss_address"
        case ssLongitude = "ss_longitude"
        case ssLatitude = "ss_latitude"
        case ssPhoneNumber = "ss_phoneNumber"
        case distance, distanceUnit
    }
}
