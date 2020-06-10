//
//  CategoryData.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 05/06/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

struct ListPro<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let data: T
}

struct DataClass: Codable {
    let result: [CateList]
}

struct CateList: Codable {
    let idx: Int
    let name: String
}

struct FoodPro<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T
}

struct DataClass2: Codable {
    let result: [FoodLists]
}

struct FoodLists: Codable {
    let idx, subCategoryIdx: Int
    let name, address: String
    let avgDeliveryTime, cheetaDelivery, rating: Int
    let introduce: String
    let picture: String
    let deliveryFee,distance: Int

    enum CodingKeys: String, CodingKey {
        case idx
        case subCategoryIdx = "sub_category_idx"
        case name, address
        case avgDeliveryTime = "avg_delivery_time"
        case cheetaDelivery = "cheeta_delivery"
        case rating, introduce, picture, distance
        case deliveryFee = "delivery_fee"
    }
}

