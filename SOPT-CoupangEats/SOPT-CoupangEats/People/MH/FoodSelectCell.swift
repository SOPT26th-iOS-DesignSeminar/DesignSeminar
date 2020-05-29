//
//  FoodSelectCell.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 29/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class FoodSelectCell: UICollectionViewCell {
    static let identifier: String = "FoodSelectCell"
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var clickImage: UIImageView!
    
    @IBAction func onClick(_ sender: UIButton) {
        if titleButton.isSelected {
            foodImage.layer.borderWidth = 0
            titleButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1), for:.normal)
            titleButton.isSelected = false
            titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            clickImage.image = UIImage(named: "")
        } else {

            clickImage.image = UIImage(named: "icnSelectBar")
            foodImage.layer.borderWidth = 1
            foodImage.layer.borderColor = CGColor(srgbRed: 13/255, green: 178/255, blue: 254/255, alpha: 1)
            titleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
            titleButton.titleLabel?.textColor = UIColor(red: 1/255, green: 175/255, blue: 255/255, alpha: 1)
            //titleButton.setTitleColor(UIColor(red: 1/255, green: 175/255, blue: 255/255, alpha: 1), for:.normal)
            titleButton.isSelected = true
            
        }
        
    }
    func set(_ foodInformation: FoodList) {
        foodImage.image = foodInformation.foodImg
        titleButton.setTitle(foodInformation.foodTitle, for: .normal)
        titleButton.contentEdgeInsets = UIEdgeInsets(top: (7+11+foodImage.frame.height), left: (foodImage.frame.height/2), bottom: 0, right: (foodImage.frame.height/2))
        foodImage.layer.cornerRadius = foodImage.frame.width / 2
        //foodImage.clipsToBounds = true
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(12))
        titleButton.setTitleColor(.black, for: .normal) //버튼 색 black으로
        
    }
    
}
