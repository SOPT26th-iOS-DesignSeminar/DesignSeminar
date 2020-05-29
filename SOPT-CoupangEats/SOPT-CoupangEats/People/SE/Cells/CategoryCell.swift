//
//  CategoryCell.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier: String = "CatCell"
    
    @IBOutlet weak var catImg: UIImageView!
    @IBOutlet weak var catName: UILabel!
    
    func set(_ categoryInformation: Category) {
        catImg.image = categoryInformation.catImg
        catName.text = categoryInformation.catName
        
        catImg.layer.cornerRadius = 29.5
    }
}
