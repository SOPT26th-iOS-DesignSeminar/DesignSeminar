//
//  MenuSelectCell.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 28/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class MenuSelectCell: UICollectionViewCell {
    static let identifier: String = "MenuSelectCell"
    
    @IBOutlet weak var menuTitleButton: UIButton!
    override func awakeFromNib() {
        menuTitleButton.tintColor = UIColor(red: 101/255, green: 105/255, blue: 110/255, alpha: 1)
        menuTitleButton.layer.borderColor = CGColor(srgbRed: 229/255, green: 232/255, blue: 236/255, alpha: 1)
        menuTitleButton.layer.borderWidth = 1
        menuTitleButton.layer.cornerRadius = 13
    }
    /*
    func set(_ menuName: MenuList) {
        menuTitleButton.setTitle(menuName.menuTitle, for: .normal)
        menuTitleButton.tintColor = UIColor(red: 101/255, green: 105/255, blue: 110/255, alpha: 1)
        menuTitleButton.layer.borderColor = CGColor(srgbRed: 229/255, green: 232/255, blue: 236/255, alpha: 1)
        menuTitleButton.layer.borderWidth = 1
        menuTitleButton.layer.cornerRadius = 13
    }*/
    
}

