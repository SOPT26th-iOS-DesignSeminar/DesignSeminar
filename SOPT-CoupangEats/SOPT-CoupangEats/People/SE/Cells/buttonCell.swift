//
//  buttonCell.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/29.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

struct cheetah {
    static var cheetahBtnClicked = false
}

class buttonCell: UITableViewCell {
    static let identifier: String = "buttonCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var cheetahBtn: UIButton!
    
    @IBAction func showCheetah(_ sender: Any) {
        if (cheetah.cheetahBtnClicked == false){
            cheetah.cheetahBtnClicked = true
        } else {
            cheetah.cheetahBtnClicked = false
        }
    }
}
