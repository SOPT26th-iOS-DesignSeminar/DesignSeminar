//
//  ReHomeViewController.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/29.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit
import Kingfisher


class ReHomeViewController: UIViewController {

    @IBOutlet weak var adCollectionView: UICollectionView!
    @IBOutlet weak var catCollectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var adList: [Ad] = []
    private var categoryList: [Category] = []
    private var restaurantList: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        setBanners()
        
        
        adCollectionView.delegate = self
        adCollectionView.dataSource = self
        
        setCatList()
        catCollectionView.delegate = self
        catCollectionView.dataSource = self
        
        setRestList()
        tableView.delegate = self
        tableView.dataSource = self
        
        print("=====")
        
        
        
        
        
    }
    
    func setBanners(){
        BannerService.shared.getBanner() { networkResult in
            switch networkResult {
            case .success(let token):
                let urls = BannerService.urls
                print(BannerService.urls)
                
                self.setAdList(urls: urls)
                
                
            case .requestErr(let message):
                print("request")
            case .pathErr : print("path")
            case .serverErr : print("server")
            case .networkFail : print("networkFail")
                
                
                
            }
            
            
        
        }
      
        
    }
    
  
    
    func setAdList(urls : [String]?){
//        var tmpImg : UIImageView = UIImageView(image: UIImage(named: "food_coffee"))\
 
        for u in urls!{
            print("callled")
            print(u)
//            tmpImg.setImage(from: u)
//            let ad1 = Ad(img: tmpImg.image!)
//            adList.append(ad1)
            let url = URL(string: u)
            do{
                let data = try Data(contentsOf: url!)
                var img = UIImage(data: data)
                let tar = CGSize(width: adCollectionView.frame.width, height: adCollectionView.frame.height)
                var new_img = UIImage.resize(image: img!, targetSize: tar)
                adList.append(Ad(img: new_img))
                
//                adList.append(Ad(img : UIImage(data: data)!))
            }catch{
                print(error.localizedDescription)
            }
           
            

        }
        
        
        
        adCollectionView.reloadData()
        
       
        
        
    }
        
        
        

    
    
    
    func setCatList() {
        let cat1 = Category(imgName: "imgBunsik", catName: "분식")
        let cat2 = Category(imgName: "imgChicken", catName: "치킨")
        let cat3 = Category(imgName: "imgPorkFeet", catName: "족발/보쌈")
        let cat4 = Category(imgName: "imgGrilledFood", catName: "구이")
        let cat5 = Category(imgName: "imgSteamedFood", catName: "찜/탕")
        
        categoryList = [cat1, cat2, cat3, cat4, cat5]
    
    }
    
    func setRestList(){
        let rest1 = Restaurant(imgName: "13", restName: "고슬 덮밥전문점", isCheetah: true, restCont: "고슬고슬한 밥 위에 젊은 셰프의 감각을 올리다.", restScore: 4.6, reviewNum: 37, detail: "배달비 2000원", isDiscount: true, delivTime: "24~24" )
        let rest2 = Restaurant(imgName: "13", restName: "고슬 덮밥전문점", isCheetah: false, restCont: "고슬고슬한 밥 위에 젊은 셰프의 감각을 올리다.", restScore: 4.6, reviewNum: 37, detail: "배달비 2000원", isDiscount: false, delivTime: "24~24" )
        let rest3 = Restaurant(imgName: "13", restName: "고슬 덮밥전문점", isCheetah: false, restCont: "고슬고슬한 밥 위에 젊은 셰프의 감각을 올리다.", restScore: 4.6, reviewNum: 37, detail: "배달비 2000원", isDiscount: true, delivTime: "24~24" )
        
        restaurantList = [rest1, rest2, rest3]
    }

}

extension ReHomeViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.adCollectionView {
            return adList.count
        } else {
            return categoryList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
          if collectionView == adCollectionView {
            guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: AdCell.identifier, for: indexPath) as? AdCell else { return UICollectionViewCell() }
            collectionCell.set(adList[indexPath.row])
            return collectionCell
          } else {
            guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
            collectionCell.set(categoryList[indexPath.row])
            return collectionCell
        }
        
      }
}

extension ReHomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width-40) / 2, height: collectionView.frame.height / 4)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


}

extension ReHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return restaurantList.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let buttonCell = tableView.dequeueReusableCell(withIdentifier: buttonCell.identifier, for: indexPath) as? buttonCell else { return UITableViewCell() }
            return buttonCell
            
        } else {
            guard let restaurantCell = tableView.dequeueReusableCell(withIdentifier: RestaurantCell.identifier, for: indexPath) as? RestaurantCell else { return UITableViewCell() }
            restaurantCell.set(restaurantList[indexPath.row])
            
            return restaurantCell
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}

extension ReHomeViewController: UITableViewDelegate {

}


extension UIImage {
    class func resize(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        var newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    class func scale(image: UIImage, by scale: CGFloat) -> UIImage? {
        let size = image.size
        let scaledSize = CGSize(width: size.width * scale, height: size.height * scale)
        return UIImage.resize(image: image, targetSize: scaledSize)
    }
}
