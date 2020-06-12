//
//  AdByServer.swift
//  SOPT-CoupangEats
//
//  Created by Yunjae Kim on 2020/06/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import UIKit

struct AdByServer {
    var adImg: UIImage?
    
    init(imgName: String) {
        self.adImg = UIImage(named: imgName)
    }
    init(){
        
        
    }
    
}
