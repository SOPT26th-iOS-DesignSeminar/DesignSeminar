//
//  StoreInformation.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 28/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
struct StoreInformation {
    var storeImg: StoreImage
    var name: String
    var time: String
    var explain: String
    var point: String
    var meter: String
    init(storeImg: StoreImage, name: String, time: String, explain: String, point: String, meter: String) {
        self.storeImg = storeImg
        self.name = name
        self.time = time
        self.explain = explain
        self.point = point
        self.meter = meter
    }
}
enum StoreImage {
    case sundae
    case smile
    
    func getImageName() -> String {
        switch self {
        case .sundae: return "imgContent1"
        case .smile: return "imgContent2"
        }
    }
}

