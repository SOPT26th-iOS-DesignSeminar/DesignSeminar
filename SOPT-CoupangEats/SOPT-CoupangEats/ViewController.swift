//
//  ViewController.swift
//  SOPT-CoupangEats
//
//  Created by 남수김 on 2020/05/23.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: 협업을 편하게 하기위해서 자신의 뷰를 보기위한 버튼 구현입니다
    // 무시하시고 작업해주세요.
    @IBAction func moveVC(_ sender: UIButton) {
        let storyboardName: String
        switch sender.tag {
        case 1:
            storyboardName = "SE"
        case 2:
            storyboardName = "MH"
        case 3:
            storyboardName = "YJ"
        case 4:
            storyboardName = "MK"
        case 5:
            storyboardName = "NS"
        default:
            return
        }
        
        let sb = UIStoryboard(name: storyboardName, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: "\(storyboardName)Main")
        
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
}

