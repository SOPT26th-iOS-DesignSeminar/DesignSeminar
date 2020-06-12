//
//  APIConstants.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 04/06/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.128.238:3000"
    static let categoryURL = APIConstants.baseURL + "/category/main"
    static let storeURL = APIConstants.baseURL + "/store"
    static let addURL = APIConstants.baseURL+"/ads"
    static let filterURL = APIConstants.baseURL+"/filter"
}
