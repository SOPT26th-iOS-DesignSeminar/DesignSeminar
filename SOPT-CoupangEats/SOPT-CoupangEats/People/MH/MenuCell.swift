//
//  MenuCell.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 28/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    static let identifier: String = "MenuCell"
    
    @IBOutlet weak var menuTitleButton: UIButton!
    
    func set(_ menuName: MenuList) {
        menuTitleButton.setTitle(menuName.menuTitleButton, for: .normal)
    }
    
}
