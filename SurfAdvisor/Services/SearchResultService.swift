//
//  SearchResultService.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON

struct SearchResultService: APIService, RequestService{
    static let shareInstance = SearchResultService()
    let URL = url("/collection/search")
    typealias NetworkData = SearchResultData
    
    func getGradeSearchResult(date: String, location: String, completion: @escaping ([Place]) -> Void, error: @escaping (Int) -> Void) {
        var gradeURL = URL + "/gradeList?si_date=\(date)&c_name=\(location)"
        gradeURL = gradeURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
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
    
    
    func getDistanceSearchResult(date: String, location: String, completion: @escaping ([Place]) -> Void, error: @escaping (Int) -> Void) {
        var distanceURL =  URL + "/distanceList?si_date=\(date)&c_name=\(location)"
        distanceURL = distanceURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        gettable(distanceURL, body: nil, header: nil) { res in
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
