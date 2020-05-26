//
//  FoodSelectCell.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 26/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class FoodSelectCell: UICollectionViewCell {
    static let identifier: String = "FoodSelectCell"
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleButton: UIButton!
    // @IBOutlet weak var foodImageButton: UIButton!
    //@IBOutlet weak var clickImage: UIImageView!
    
    func set(_ foodInformation: FoodList) {
        foodImage.image = foodInformation.foodImg
        titleButton.setTitle(foodInformation.foodTitle, for: .normal)
       // titleLabel.text = foodInformation.foodTitle
        //clickImage.image = foodInformation.onclick
        foodImage.layer.cornerRadius = foodImage.frame.height / 2
        foodImage.clipsToBounds = true
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(12))
        titleButton.setTitleColor(.black, for: .normal) //버튼 색 black으로
    }
}
