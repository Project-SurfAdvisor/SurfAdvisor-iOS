//
//  CityListService.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 11. 6..
//  Copyright © 2018년 박세은. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON

struct CityListService: APIService, RequestService{
    static let shareInstance = CityListService()
    let URL = url("/collection/cityList")
    typealias NetworkData = CityListData
    
    func getCityList(completion: @escaping ([City]) -> Void, error: @escaping (Int) -> Void) {
        
        gettable(URL, body: nil, header: nil) { res in
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
