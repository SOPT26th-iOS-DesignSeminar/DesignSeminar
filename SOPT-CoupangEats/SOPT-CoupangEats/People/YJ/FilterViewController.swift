//
//  FilterViewController.swift
//  SOPT-CoupangEats
//
//  Created by Yunjae Kim on 2020/05/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
 
    @IBOutlet weak var TimeSlider1: UISlider!
    @IBOutlet weak var TimeSlider2: UISlider!
    @IBOutlet weak var priceSlider1: UISlider!
    @IBOutlet weak var priceSlider2: UISlider!
    
    var startTime : Int = 0
    var endTime : Int = 120
    var btnIdx : Int = 0
    var startPrice : Int = 0
    var endPrice : Int = 300000
    
    @IBOutlet var btnList: [UIButton]!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImage = UIImage(named: "btnFilterControl")
        
        TimeSlider1.setThumbImage(thumbImage, for : .normal)
        TimeSlider2.setThumbImage(thumbImage, for : .normal)
        priceSlider1.setThumbImage(thumbImage, for : .normal)
        priceSlider2.setThumbImage(thumbImage, for : .normal)
        
        TimeSlider1.minimumValue = 0
        TimeSlider1.maximumValue = 60
        TimeSlider1.isContinuous = false
        
        
        TimeSlider2.minimumValue = 60
        TimeSlider2.maximumValue = 120
        TimeSlider2.isContinuous = false
        
        priceSlider1.minimumValue = 0
        priceSlider1.maximumValue = 15
        priceSlider1.isContinuous = false
        
        priceSlider2.minimumValue = 15
        priceSlider2.maximumValue = 30
        priceSlider2.isContinuous = false
        
        setPriceLabel()
        
        setTimeLabel()
        setButtons()
        
        resetButton.backgroundColor = UIColor.white
        resetButton.tintColor = UIColor(red: 149/255, green: 159/255, blue: 171/255, alpha: 1)
        resetButton.layer.borderWidth = 0.2
        resetButton.layer.borderColor = UIColor.black.cgColor
        
        
        applyButton.backgroundColor = UIColor(red: 78/255, green: 172/255, blue: 248/255, alpha: 1)
        applyButton.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        applyButton.layer.borderWidth = 0.2
        applyButton.layer.borderColor = UIColor.black.cgColor
        
        

        // Do any additional setup after loading the view.
    }
    
   
    
    func setButtons(){
        for btn in btnList{
            btn.layer.borderWidth = 0.2
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.cornerRadius = 12.0
            
            
            if(btn == btnList[btnIdx]){
                btn.backgroundColor=UIColor(red: 62/255, green: 62/255, blue: 62/255, alpha: 1)
                btn.tintColor = UIColor.white
                
            }
            else{
                btn.backgroundColor = UIColor.white
                btn.tintColor = UIColor.black
                
                
                
            }
                
            
        }
    }
    
 
    
    
    @IBAction func btnRecommend(_ sender: Any) {
        btnIdx = 0
        setButtons()
    }
    
    
    @IBAction func btnMany(_ sender: Any) {
        btnIdx = 1
        setButtons()
    }
    
    
    @IBAction func btnNear(_ sender: Any) {
        btnIdx = 2
        setButtons()
    }
    
        
    @IBAction func btnStar(_ sender: Any) {
        btnIdx = 3
        setButtons()
    }
    
//    TimeSlider1 value setting해주는 함수
    func valueSetTS1(input : Float)-> Float {
        
        if(input > 50){
            startTime = 60
            return 60
        }
        else if(input > 20){
            startTime = 30
            return 30
        }
        else{
            startTime = 0
            return 0
        }
    }
//    TimeSlider2 value setting해주는 함수
    func valueSetTS2(input : Float)-> Float {
        
        if(input > 110){
            endTime = 120
            return 120
        }
        else if(input > 80){
            endTime = 90
            return 90
        }
        else{
            endTime = 60
            return 60
        }
    }
    
    func setTimeLabel(){
        var left : String = ""
        var right : String = ""
        
        switch(startTime){
        case 0 :
            left = "10분"
            break
        case 30:
            left = "30분"
            break
        case 60:
            left = "1시간"
            break
        default:
            break
        }
        
        switch(endTime){
        case 60:
            right = "1시간"
            break
        case 90:
            right = "1시간 30분"
            break
        case 120:
            right = "2시간"
            break
        default:
            break
        }
        
        
        
        let res = left + "~" + right
        
        timeLabel.text = res
        
    }
    
    func setPriceLabel(){
        var left = String(startPrice)
        var right = String(endPrice)
        
        if(left != "0"){
            let l = left.index(left.startIndex,offsetBy: (left.count-3))
            left.insert(",", at: l)
        }
        
        
        let r = right.index(right.startIndex,offsetBy: (right.count-3))
        right.insert(",", at: r)
        
        priceLabel.text = left + "원~ " + right + "원"
        
        
        
    }
    
//    timeSlider1 값 변할때 불리는 함수
    @IBAction func timeSlider1Value(_ sender: UISlider) {
        sender.setValue(valueSetTS1(input: TimeSlider1.value) , animated: true)
   
        setTimeLabel()
        
    }
    
//    timeSlider2 값 변할때 불리는 함수
    @IBAction func timeSlider2Value(_ sender: UISlider) {
        sender.setValue(valueSetTS2(input: TimeSlider2.value) , animated: true)

        setTimeLabel()
        
    }
    
    
//   priceSlider1 값 변할때 불리는 함수
    @IBAction func priceSlider1Value(_ sender: UISlider) {
        let res = Int(priceSlider1.value)
        startPrice = res*10000
        sender.setValue(Float(res), animated: true)
        setPriceLabel()
        
    }
    
//   priceSlider2 값 변할때 불리는 함수
    @IBAction func priceSlider2Value(_ sender: UISlider) {
        let res = Int(priceSlider2.value)
        endPrice = res*10000
        sender.setValue(Float(res), animated: true)
        setPriceLabel()
    }
    
    
    
    
    @IBAction func allReset(_ sender: Any) {
        
        startTime = 0
        endTime = 120
        btnIdx  = 0
        startPrice  = 0
        endPrice = 300000
        
        TimeSlider1.value = 0
        TimeSlider2.value = 120
        
        priceSlider1.value = 0
        priceSlider2.value = 30
        
        setButtons()
        setPriceLabel()
        setTimeLabel()
        
    }
    
    @IBAction func applying(_ sender: Any) {
        FilterService.shared.filtering(time_min: startTime, time_max: endTime, money_min: startPrice, money_max: endPrice, sort_type: "rating"){networkResult in
            
            switch networkResult {
                
            case .success(let token) :
                print(FilterService.filteredDatas[0].avg_delivery_time)
                
                
                
                
            
            case .requestErr:
                print("req                        |   1 +
                    SOPT-CoupangEats/SOPT-CoupangEats/People/SE/NetworkResult.swift                       |  21 ++++++++
                    SOPT-CoupangEats/SOPT-CoupangEats/People/SE/Structs/Ad.swift                          |   7 ++-
                    SOPT-CoupangEats/SOPT-CoupangEats/People/SE/Structs/AdByServer.swift                  |  23 ++++++++
                    .../SOPT-CoupangEats/People/SE/ViewControllers/ReHomeViewController.swift             | 117 +++++++++++++++++++++++++++++++++++++++--
                    SOPT-CoupangEats/SOPT-CoupangEats/People/YJ/FilterData.swift                          |  73 +++++++++++++++++++++++++
                    SOPT-CoupangEats/SOPT-CoupangEats/People/YJ/FilterService.swift                       |  85 ++++++++++++++++++++++++++++++
                    SOPT-CoupangEats/SOPT-CoupangEats/People/YJ/FilterViewControluest")
            case .pathErr :
                print("path")
            case .serverErr:
                print("serverError")
            case .networkFail:
                print("networkFail")
            
    
            
            
        }
        
        
        
    }
    
    
    
}
    
}
    


class CustomSlider: UISlider {

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let customBounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width, height: 5.0))
        super.trackRect(forBounds: customBounds)
        return customBounds
    }

}
