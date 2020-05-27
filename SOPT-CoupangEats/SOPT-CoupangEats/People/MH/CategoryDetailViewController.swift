//
//  CategoryDetailViewController.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 25/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController{

    @IBOutlet weak var FoodSelectCollectionView: UICollectionView!
    @IBOutlet weak var MenuCollectionView: UICollectionView!
    
    private var foodList: [FoodList] = []
    private var menuList: [MenuList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.navigationController?.navigationBar.isTranslucent = true
        // navigation bar 투명으로
        setFoodList()
        setMenuList()
        FoodSelectCollectionView.delegate = self
        FoodSelectCollectionView.dataSource = self
        MenuCollectionView.delegate = self
        MenuCollectionView.dataSource = self
        let layout = FoodSelectCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal // 가로스크롤
        //let layout2 = MenuCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //layout2.scrollDirection = .horizontal // 가로스크롤

    }
    private func setFoodList() {
        let food1 = FoodList(foodName: "imgBunsik", title: "분식")
        let food2 = FoodList(foodName: "imgChicken", title: "치킨")
        let food3 = FoodList(foodName: "imgPorkFeet", title: "족발/보쌈")
        let food4 = FoodList(foodName: "imgSteamedFood", title: "찜/탕")
        let food5 = FoodList(foodName: "imgGrilledFood", title: "구이")
        foodList = [food1,food2,food3,food4,food5]
    }

    private func setMenuList() {
        let menu1 = MenuList(menutitle: "찜닭")
        let menu2 = MenuList(menutitle: "갈비탕")
        let menu3 = MenuList(menutitle: "아구찜")
        let menu4 = MenuList(menutitle: "삼계탕")
        let menu5 = MenuList(menutitle: "설렁탕")
        let menu6 = MenuList(menutitle: "순대국")
        menuList = [menu1,menu2,menu3,menu4,menu5,menu6]
    }
    
}
extension CategoryDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    indexPath: IndexPath) -> CGSize {
        if collectionView == FoodSelectCollectionView {
            return CGSize(width: collectionView.frame.width / 6 , height: (collectionView.frame.width / 6)+50+11)
        }
        if collectionView == MenuCollectionView {
            return CGSize(width: 50 , height: 20)
        }
        return CGSize(width: collectionView.frame.width / 6 , height: (collectionView.frame.width / 6)+50+11)
    }//Cell width, height 지정
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == FoodSelectCollectionView {
            return UIEdgeInsets(top: 11, left: 11, bottom: 0, right: 11)
        }
        if collectionView == MenuCollectionView {
            return UIEdgeInsets(top: 15, left: 22, bottom: 0, right: 22)
        }
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //CollectionView ContentInset 지정
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == FoodSelectCollectionView {
            return 11
        }
        if collectionView == MenuCollectionView {
            return 7
        }
        return 0
        //CollectionView Cell 양 옆 간격 지정
    }
    
}

extension CategoryDetailViewController: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == FoodSelectCollectionView {
            return foodList.count
        }
        
        if collectionView == MenuCollectionView {
            return menuList.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodSelectCell.identifier, for: indexPath) as? FoodSelectCell
        else { return UICollectionViewCell() }
        
        if collectionView == FoodSelectCollectionView {
        foodCell.set(foodList[indexPath.row])
            return foodCell
            
        }
        if collectionView == MenuCollectionView {
            guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuSelectCell.identifier, for: indexPath) as? MenuSelectCell
            else { return UICollectionViewCell() }
            menuCell.set(menuList[indexPath.row])
            return menuCell
        }
        return foodCell
    }
}



