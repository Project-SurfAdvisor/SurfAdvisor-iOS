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
    let data:Info
    let message: String
}

struct Info: Codable {
    let surfShopList: [SurfShopList]
    let restaurantList: [RestaurantList]
    let hotelList: [HotelList]
}

struct HotelList: Codable {
    let hPhoto: String
    let hName, hAddress: String
    let hLongitude, hLatitude: Double
    let hPhoneNumber: String
    let distance: Double
    let distanceUnit: String
    
    enum CodingKeys: String, CodingKey {
        case hPhoto = "h_photo"
        case hName = "h_name"
        case hAddress = "h_address"
        case hLongitude = "h_longitude"
        case hLatitude = "h_latitude"
        case hPhoneNumber = "h_phoneNumber"
        case distance, distanceUnit
    }
}

struct RestaurantList: Codable {
    let rPhoto: String
    let rName, rExplain1, rExplain2, rTime: String
    let rAddress: String
    let rLongitude, rLatitude: Double
    let rPhoneNumber: String
    let distance: Double
    let distanceUnit: String
    
    enum CodingKeys: String, CodingKey {
        case rPhoto = "r_photo"
        case rName = "r_name"
        case rExplain1 = "r_explain1"
        case rExplain2 = "r_explain2"
        case rTime = "r_time"
        case rAddress = "r_address"
        case rLongitude = "r_longitude"
        case rLatitude = "r_latitude"
        case rPhoneNumber = "r_phoneNumber"
        case distance, distanceUnit
    }
}

struct SurfShopList: Codable {
    let ssPhoto: String
    let ssName: String
    let ssSite: String
    let ssIntroduction, ssTime, ssAddress: String
    let ssLongitude, ssLatitude: Double
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
