//
//  Restaurants.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

struct Restaurant {
    var restImg: UIImage?
    var restName: String
    var isCheetah: Bool
    var restCont: String
    var restScore: Float
    var reviewNum: Int
    var detail: String
    var isDiscount: Bool
    var delivTime: String
    
    init(imgName: String, restName: String, isCheetah: Bool, restCont: String, restScore: Float, reviewNum: Int, detail: String, isDiscount: Bool, delivTime: String) {
        self.restImg = UIImage(named: imgName)
        self.restName = restName
        self.isCheetah = isCheetah
        self.restCont = restCont
        self.restScore = restScore
        self.reviewNum = reviewNum
        self.detail = detail
        self.isDiscount = isDiscount
        self.delivTime = delivTime
    }
    
}
