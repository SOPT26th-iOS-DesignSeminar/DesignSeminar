//
//  UIView+Extension.swift
//  SOPT-CoupangEats
//
//  Created by 남수김 on 2020/05/28.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func applyRadius() {
        let minFrame = min(frame.width, frame.height)
        layer.cornerRadius = minFrame/2
    }
}
