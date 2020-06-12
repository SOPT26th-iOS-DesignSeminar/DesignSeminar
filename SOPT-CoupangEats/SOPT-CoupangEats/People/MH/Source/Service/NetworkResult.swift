//
//  NetworkResult.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 05/06/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
