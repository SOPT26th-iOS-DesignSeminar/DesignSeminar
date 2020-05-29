//
//  BannerCollectionViewCell.swift
//  SOPT-CoupangEats
//
//  Created by 남수김 on 2020/05/27.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImgView: UIImageView!
    static let reuseIdentifier = "BannerCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
