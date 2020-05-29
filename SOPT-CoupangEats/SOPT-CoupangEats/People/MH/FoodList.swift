//
//  FoodList.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 26/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit
struct FoodList {
    var foodImg: UIImage?
    var foodTitle: String
    //var onclick: UIImage?
    //init(title: String, bluelight: String, foodName: String)
    init(foodName: String,title: String) {
        self.foodImg = UIImage(named: foodName)
        self.foodTitle = title
        //self.onclick = UIImage(named: bluelight)
        
    }
    
}
