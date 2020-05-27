//
//  Category.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

struct Category {
    var catImg: UIImage?
    var catName: String
    
    init(imgName: String, catName: String) {
        self.catImg = UIImage(named: imgName)
        self.catName = catName
    }
    
}
