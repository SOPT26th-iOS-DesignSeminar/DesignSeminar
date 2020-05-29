//
//  AddCell.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/29.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class AdCell: UICollectionViewCell {
    static let identifier: String = "AdCell"
    
    @IBOutlet weak var adImg: UIImageView!
    
    func set(_ adInformation: Ad) {
        adImg.image = adInformation.adImg
    }
}
