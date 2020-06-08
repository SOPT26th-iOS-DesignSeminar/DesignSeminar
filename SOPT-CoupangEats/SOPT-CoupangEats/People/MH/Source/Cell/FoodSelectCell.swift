//
//  FoodSelectCell.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 29/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

protocol ButtonSenderable {
    func onClickButton(in indePath: IndexPath)
}

class FoodSelectCell: UICollectionViewCell {
    //var title : String = ""
    static let identifier: String = "FoodSelectCell"
    
    override var isSelected: Bool {
        willSet {
            clickImage.image = newValue ? UIImage(named: "icnSelectBar") : nil
            foodImage.layer.borderWidth = newValue ? 1 : 0
            foodImage.layer.borderColor = newValue ? CGColor(srgbRed: 13/255, green: 178/255, blue: 254/255, alpha: 1) : nil
            titleLabel.textColor = newValue ? UIColor(red: 1/255, green: 175/255, blue: 255/255, alpha: 1) : UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        
        }
    }
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var clickImage: UIImageView!
    
    func set(_ foodInformation: FoodList) {
        foodImage.image = foodInformation.foodImg
        titleLabel.text = foodInformation.foodTitle
        foodImage.layer.cornerRadius = foodImage.frame.width / 2
        //foodImage.clipsToBounds = true
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(12))
        titleLabel.textColor = UIColor.black
        
    }
    
}
