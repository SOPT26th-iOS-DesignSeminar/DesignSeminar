//
//  HomeViewController.swift
//  SOPT-CoupangEats
//
//  Created by SeongEun on 2020/05/26.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var catCollectionView: UICollectionView!
    @IBOutlet weak var restCollectionView: UICollectionView!
    
    private var categoryList: [Category] = []
    private var restaurantList: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCatList()
        catCollectionView.delegate = self
        catCollectionView.dataSource = self
        
        setRestList()
        restCollectionView.delegate = self
        restCollectionView.dataSource = self
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
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.catCollectionView {
            return categoryList.count
        }
        if collectionView == self.restCollectionView {
            return restaurantList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
        if collectionView == catCollectionView {
            guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
            collectionCell.set(categoryList[indexPath.row])
            return collectionCell
        } else {
            guard let restaurantCell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCell.identifier, for: indexPath) as? RestaurantCell else { return UICollectionViewCell() }
            restaurantCell.set(restaurantList[indexPath.row])
            return restaurantCell
        }
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
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

