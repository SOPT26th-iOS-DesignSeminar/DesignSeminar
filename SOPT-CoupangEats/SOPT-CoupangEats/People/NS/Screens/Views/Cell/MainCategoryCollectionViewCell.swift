//
//  MainCategoryCollectionViewCell.swift
//  SOPT-CoupangEats
//
//  Created by 남수김 on 2020/05/27.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class MainCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImgView: UIImageView!
    
    static let reuseIdentifier = "MainCategoryCell"
    
    lazy var foodImgString = ["imgPorkFeet", "imgChicken", "imgBunsik"]
    
    override func awakeFromNib() {
        let random = Int.random(in: 0..<foodImgString.count)
        foodImgView.image = UIImage(named: foodImgString[random])
    }
}
