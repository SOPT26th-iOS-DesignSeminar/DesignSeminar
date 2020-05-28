//
//  Category_detailViewController.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 28/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class Category_detailViewController: UIViewController {

    @IBOutlet weak var DetailTableView: UITableView!
    @IBOutlet weak var FoodSelectCollectionView: UICollectionView!
    
    private var foodList: [FoodList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .black
        setFoodList()
        let layout = FoodSelectCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal // 가로스크롤
    }
    
    private func setFoodList() {
           let food1 = FoodList(foodName: "imgBunsik", title: "분식")
           let food2 = FoodList(foodName: "imgChicken", title: "치킨")
           let food3 = FoodList(foodName: "imgPorkFeet", title: "족발/보쌈")
           let food4 = FoodList(foodName: "imgSteamedFood", title: "찜/탕")
           let food5 = FoodList(foodName: "imgGrilledFood", title: "구이")
           foodList = [food1,food2,food3,food4,food5]
       }
    


}
extension Category_detailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 6 , height: (collectionView.frame.width / 6)+50+11)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 11, bottom: 0, right: 11)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 11
    }
}

extension Category_detailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return foodList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            guard let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodSelectCell.identifier, for: indexPath) as? FoodSelectCell
            else { return UICollectionViewCell() }
        foodCell.set(foodList[indexPath.row])
            return foodCell
        
    }
    
}
