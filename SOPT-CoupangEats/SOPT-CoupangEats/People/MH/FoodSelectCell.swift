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
    
    @IBOutlet weak var clickImage: UIImageView!
    //@IBOutlet weak var clickImage: UIImageView!
    @IBAction func onClick(_ sender: UIButton) {
        clickImage.image = UIImage(named: "icnSelectBar")
        foodImage.layer.borderWidth = 1
        foodImage.layer.borderColor = CGColor(srgbRed: 13/255, green: 178/255, blue: 254/255, alpha: 1)
        titleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        titleButton.setTitleColor(UIColor(red: 1/255, green: 175/255, blue: 255/255, alpha: 1), for:.normal)
        
    }

    func set(_ foodInformation: FoodList) {
        foodImage.image = foodInformation.foodImg
        titleButton.setTitle(foodInformation.foodTitle, for: .normal)
        foodImage.layer.cornerRadius = foodImage.frame.height / 2
        foodImage.clipsToBounds = true // 이미지 둥글게
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(12))
        titleButton.setTitleColor(.black, for: .normal) //버튼 색 black으로
        titleButton.contentEdgeInsets = UIEdgeInsets(top:(7+11+foodImage.frame.height),left: 0,bottom: 0,right: 0)
        
    }
}
