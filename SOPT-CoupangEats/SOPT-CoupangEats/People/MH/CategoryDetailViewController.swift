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
    
    private var foodList: [FoodList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        // navigation bar 투명으로
        setFoodList()
        FoodSelectCollectionView.delegate = self
        FoodSelectCollectionView.dataSource = self
        let layout = FoodSelectCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal // 가로스크롤
        
        // Do any additional setup after loading the view.
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
extension CategoryDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 6 , height: (collectionView.frame.width / 6)+50)
        //Cell width, height 지정
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 11)
        //CollectionView ContentInset 지정
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
        //CollectionView Cell 양 옆 간격 지정
    }
    
}

extension CategoryDetailViewController: UICollectionViewDataSource {

    
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


