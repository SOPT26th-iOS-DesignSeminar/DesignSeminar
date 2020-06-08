//
//  CategoryData.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 05/06/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

struct Project: Codable {
    let status: Int
    let success: Bool
    let data: DataClass
}

struct DataClass: Codable {
    let result: [CateList]
}

struct CateList: Codable {
    let categoryIdx: Int
    let name: String
}
