//
//  RestaurantCell.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class RestaurantCell: UICollectionViewCell {
    static let identifier: String = "RestaurantCell"
    
    @IBOutlet weak var restImgView: UIImageView!
    @IBOutlet weak var restNameLabel: UILabel!
    @IBOutlet weak var cheetahImgView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var discountImgView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    func set(_ restaurantInformation: Restaurant) {
        restImgView.image = restaurantInformation.restImg
        restNameLabel.text = restaurantInformation.restName
        if (restaurantInformation.isCheetah == true) {
            cheetahImgView.isHidden = false
        } else {
            cheetahImgView.isHidden = true
        }
        contentLabel.text = restaurantInformation.restCont
        scoreLabel.text = String(restaurantInformation.restScore) + " (" + String(restaurantInformation.reviewNum)+")"
        detailLabel.text = restaurantInformation.detail
        if (restaurantInformation.isDiscount == true) {
            discountImgView.isHidden = false
        } else {
            discountImgView.isHidden = true
        }
        timeLabel.text = restaurantInformation.delivTime
    }
}
