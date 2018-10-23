//
//  SearchResultService.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation

import Foundation
import Alamofire
import SwiftyJSON

struct GradeSearchResultService: APIService, RequestService{
    static let shareInstance = GradeSearchResultService()
    let URL = url("/collection/search")
    typealias NetworkData = SearchResultData
    
    func getGradeSearchResult(date: String, longitude: Double, latitude: Double, completion: @escaping ([Place]) -> Void, error: @escaping (Int) -> Void) {
        let gradeURL = URL + "/iOSgradeList?si_date=\(date)&longitude=\(longitude)&latitude=\(latitude)"
        
        gettable(gradeURL, body: nil, header: nil) { res in
            switch res {
            case .success(let SearchResultData):
                let data = SearchResultData.data
                completion(data)
            case .successWithNil(_):
                break
            case .error(let errCode):
                error(errCode)
            }
        }
    }
    
    
    
    func getDistanceSearchResult(date: String, longitude: Double, latitude: Double, completion: @escaping ([Place]) -> Void, error: @escaping (Int) -> Void) {
        let distanceURL = URL + "/iOSdistanceList?si_date=\(date)&longitude=\(longitude)&latitude=\(latitude)"
        
        gettable(gradeURL, body: nil, header: nil) { res in
            switch res {
            case .success(let SearchResultData):
                let data = SearchResultData.data
                completion(data)
            case .successWithNil(_):
                break
            case .error(let errCode):
                error(errCode)
            }
        }
    }
    
}
