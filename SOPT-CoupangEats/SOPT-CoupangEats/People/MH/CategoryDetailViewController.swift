//
//  CategoryDetailViewController.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 25/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController{

    let ChitaOn : UIImage = UIImage(named:"btnSelectedChitadelilvery")!
    let ChitaOff : UIImage = UIImage(named:"btnUnselectedChitadelivery")!
    var ClickNum = 0 // Chita 버튼 눌렸는지 안눌렸는지
    
    @IBOutlet weak var FoodSelectCollectionView: UICollectionView!
    @IBOutlet weak var MenuCollectionView: UICollectionView!
    @IBOutlet weak var Chitadelilvery: UIButton!
    @IBOutlet weak var StoreTableView: UITableView!
    @IBAction func ChitadelilveryClick(_ sender: UIButton) {
        if ClickNum == 0 { //버튼 안눌려있으면
            Chitadelilvery.setImage(ChitaOn, for: .normal)
            ClickNum = 1
            
        } else { //버튼이 눌려있으면
            Chitadelilvery.setImage(ChitaOff, for: .normal)
            ClickNum = 0
        }
    
    }
    private var foodList: [FoodList] = []
    private var menuList: [MenuList] = []
    private var storeList: [StoreInformation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .black

        // navigation bar 투명으로
        setFoodList()
        setMenuList()
        setStoreList()
        FoodSelectCollectionView.delegate = self
        FoodSelectCollectionView.dataSource = self
        MenuCollectionView.delegate = self
        MenuCollectionView.dataSource = self
        StoreTableView.delegate = self
        StoreTableView.dataSource = self
        let layout = FoodSelectCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal // 가로스크롤
        let layout2 = MenuCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout2.scrollDirection = .horizontal // 가로스크롤

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
    private func setStoreList() {
        let store1 = StoreInformation(storeImg: .sundae, name: "백암왕순대 소머리국밥", time: "20분~30분", explain: "백암왕순대 소머리국밥은.용인백암왕순대의 전통을 이어가기 위해 ‘직접 삶아 우러내는’ 슬로건으로 초심을 첫 마음처럼 지켜가겠습니다.", point: "4.5 (307)", meter: "• 2.7 km")
        let store2 = StoreInformation(storeImg: .smile, name: "스마일한식", time: "20분~30분", explain: "신선한 재료로 남녀노소 가격부담없이 즐길 수 있도록 최고의 서비스를 제공하겠습니다!", point: "4.5 (307)", meter: "• 2.7 km")
        let store3 = StoreInformation(storeImg: .sundae
            , name: "백암왕순대 소머리국밥", time: "20분~30분", explain: "백암왕순대 소머리국밥은.용인백암왕순대의 전통을 이어가기 위해 ‘직접 삶아 우러내는’ 슬로건으로 초심을 첫 마음처럼 지켜가겠습니다.", point: "4.5 (307)", meter: "• 2.7 km")
        let store4 = StoreInformation(storeImg: .smile, name: "스마일한식", time: "20분~30분", explain: "신선한 재료로 남녀노소 가격부담없이 즐길 수 있도록 최고의 서비스를 제공하겠습니다!", point: "4.5 (307)", meter: "• 2.7 km")
        storeList = [store1,store2,store3,store4]
        /*var storeImg: StoreImage
        var name: String
        var time: String
        var explain: String
        var point: String
        var meter: String*/
    }
    
}
extension CategoryDetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    indexPath: IndexPath) -> CGSize {
        if collectionView == FoodSelectCollectionView {
            return CGSize(width: collectionView.frame.width / 6 , height: (collectionView.frame.width / 6)+50+11)
        }
        if collectionView == MenuCollectionView {
            return CGSize(width: 50 , height: 26)
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
        
        if collectionView == FoodSelectCollectionView {
            guard let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodSelectCell.identifier, for: indexPath) as? FoodSelectCell
            else { return UICollectionViewCell() }
        foodCell.set(foodList[indexPath.row])
            return foodCell
            
        } else {
            guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuSelectCell.identifier, for: indexPath) as? MenuSelectCell
            else { return UICollectionViewCell() }
            menuCell.set(menuList[indexPath.row])
            return menuCell
        }
        
    }
}
extension CategoryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 263
    }
    
}
extension CategoryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let storeCell = tableView.dequeueReusableCell(withIdentifier: StoreListCell.identifier, for:
        indexPath) as? StoreListCell else { return UITableViewCell() }
        storeCell.storeInformation(storeImg: storeList[indexPath.row].storeImg.getImageName(), name: storeList[indexPath.row].name, time: storeList[indexPath.row].time, explain: storeList[indexPath.row].explain, point: storeList[indexPath.row].point, meter: storeList[indexPath.row].meter)
        return storeCell
    }
    
    
}


