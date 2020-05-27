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
    
    func set(_ menuName: MenuList) {
        menuTitleButton.setTitle(menuName.menuTitle, for: .normal)
        //print("얌얌얌",menuName.menuTitle)
    }
    
}

