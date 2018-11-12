//
//  NetworkResult.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case successWithNil(Int)
    case error(Int)
}
