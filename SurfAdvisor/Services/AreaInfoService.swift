//
//  InfoDetailService.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON

struct AreaInfoService: APIService, RequestService{
    static let shareInstance = AreaInfoService()
    let URL = url("/surfArea")
    typealias NetworkData = AreaInfoData
    
    func getAreaInfo(id: Int, completion: @escaping (Info) -> Void, error: @escaping (Int) -> Void) {
        let areaURL = URL + "/info?sa_id=\(id)"
        
        gettable(areaURL, body: nil, header: nil) { res in
            switch res {
            case .success(let AreaDetailData):
                let data = AreaDetailData.data
                completion(data)
            case .successWithNil(_):
                break
            case .error(let errCode):
                error(errCode)
            }
        }
    }
    
    
}
