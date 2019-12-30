//
//  APIService.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 23..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

protocol APIService {
}

extension APIService {
    static func url(_ path: String) -> String {
        return "http://advisorsurf.ml" + path
    }
}
