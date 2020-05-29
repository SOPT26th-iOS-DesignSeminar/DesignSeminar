//
//  ReHomeViewController.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/29.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

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
        setAdList()
        adCollectionView.delegate = self
        adCollectionView.dataSource = self
        
        setCatList()
        catCollectionView.delegate = self
        catCollectionView.dataSource = self
        
        setRestList()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setAdList() {
        let ad1 = Ad(imgName: "imgHomeFirstadvertising")
        let ad2 = Ad(imgName: "imgHomeFirstadvertising")
        
        adList = [ad1, ad2]
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
