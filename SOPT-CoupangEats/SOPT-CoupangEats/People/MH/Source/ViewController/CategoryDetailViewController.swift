//
//  CategoryDetailViewController.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 29/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController {

    let ChitaOn : UIImage = UIImage(named:"btnSelectedChitadelilvery")!
    let ChitaOff : UIImage = UIImage(named:"btnUnselectedChitadelivery")!
    var CateModel: ListPro<DataClass>?
    var StoreModel: FoodPro<DataClass2>?
    
    @IBOutlet weak var StoreTableView: UITableView!
    @IBOutlet weak var FoodSelectCollectionView: UICollectionView!
    @IBOutlet weak var MenuSelectCollectionView: UICollectionView!
    @IBOutlet weak var Chitadelilvery: UIButton!
    @IBAction func ChitadelilveryClick(_ sender: UIButton) {
        if Chitadelilvery.isSelected {
            Chitadelilvery.setImage(ChitaOff, for: .normal)
            Chitadelilvery.isSelected = false
        } else {
            Chitadelilvery.setImage(ChitaOn, for: .normal)
            Chitadelilvery.isSelected = true
        }
    }
    
    private var isSelected: [Bool] = Array(repeating: false, count: 5)
    
    //private var foodList: [FoodList] = []
    private var menuList: [MenuList] = []
    private var storeList: [StoreInformation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCate()
        getStore()
        FoodSelectCollectionView.delegate = self
        FoodSelectCollectionView.dataSource = self
        MenuSelectCollectionView.delegate = self
        MenuSelectCollectionView.dataSource = self
        StoreTableView.delegate = self
        StoreTableView.dataSource = self
        
        setNaviTitle()
        //setFoodList()
        setMenuList()
        //setStoreList()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .black
        let layout = FoodSelectCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal // 가로스크롤
        let layout2 = MenuSelectCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout2.scrollDirection = .horizontal // 가로스크롤
        StoreTableView.separatorStyle = .none
        //self.navigationController?.navigationBar.topItem?.title =

        
    }
    /*
    private func setFoodList() {
        let food1 = FoodList(foodName: "imgBunsik", title: "분식")
        let food2 = FoodList(foodName: "imgChicken", title: "치킨")
        let food3 = FoodList(foodName: "imgPorkFeet", title: "족발/보쌈")
        let food4 = FoodList(foodName: "imgSteamedFood", title: "찜/탕")
        let food5 = FoodList(foodName: "imgGrilledFood", title: "구이")
        foodList = [food1,food2,food3,food4,food5]
    }*/
    private func setMenuList() {
        let menu1 = MenuList(menutitle: "찜닭")
        let menu2 = MenuList(menutitle: "갈비탕")
        let menu3 = MenuList(menutitle: "아구찜")
        let menu4 = MenuList(menutitle: "삼계탕")
        let menu5 = MenuList(menutitle: "설렁탕")
        let menu6 = MenuList(menutitle: "순대국")
        menuList = [menu1,menu2,menu3,menu4,menu5,menu6]
    }
    /*
    private func setStoreList() {
        let store1 = StoreInformation(storeImg: .sundae, name: "백암왕순대 소머리국밥", time: "20분~30분", explain: "백암왕순대 소머리국밥은.용인백암왕순대의 전통을 이어가기 위해 ‘직접 삶아 우러내는’ 슬로건으로 초심을 첫 마음처럼 지켜가겠습니다.", point: "4.5 (307)", meter: "• 2.7 km")
        let store2 = StoreInformation(storeImg: .smile, name: "스마일한식", time: "20분~30분", explain: "신선한 재료로 남녀노소 가격부담없이 즐길 수 있도록 최고의 서비스를 제공하겠습니다!", point: "4.5 (307)", meter: "• 2.7 km")
        let store3 = StoreInformation(storeImg: .sundae
            , name: "백암왕순대 소머리국밥", time: "20분~30분", explain: "백암왕순대 소머리국밥은.용인백암왕순대의 전통을 이어가기 위해 ‘직접 삶아 우러내는’ 슬로건으로 초심을 첫 마음처럼 지켜가겠습니다.", point: "4.5 (307)", meter: "• 2.7 km")
        let store4 = StoreInformation(storeImg: .smile, name: "스마일한식", time: "20분~30분", explain: "신선한 재료로 남녀노소 가격부담없이 즐길 수 있도록 최고의 서비스를 제공하겠습니다!", point: "4.5 (307)", meter: "• 2.7 km")
        storeList = [store1,store2,store3,store4]
    }*/
    private func setNaviTitle() {
        guard let title = self.title else {return}
        navigationController?.navigationBar.topItem?.title = title
    }
    

}
extension CategoryDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cells = collectionView.cellForItem(at: indexPath) as? FoodSelectCell
        navigationController?.navigationBar.topItem?.title = cells?.titleLabel.text
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    indexPath: IndexPath) -> CGSize {
        if collectionView == FoodSelectCollectionView {
        return CGSize(width: collectionView.frame.width / 6, height: (collectionView.frame.width / 6)+50+8)
        } else {
            return CGSize(width: 50 , height: 25)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == FoodSelectCollectionView {
            return UIEdgeInsets(top: 11, left: 11, bottom: 0, right: 11) }
        else {
            return UIEdgeInsets(top: 15, left: 22, bottom: 0, right: 22)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == FoodSelectCollectionView {
            return 11
        } else {
            return 7
        }
        
    }
}
extension CategoryDetailViewController: UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == FoodSelectCollectionView {
            return CateModel?.data.result.count ?? 0
            
        } else {
            return menuList.count
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == FoodSelectCollectionView {
        guard let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodSelectCell.identifier, for: indexPath) as? FoodSelectCell
            else { return UICollectionViewCell() }
        //foodCell.set(foodList[indexPath.row])
            //foodCell.titleLabel.text = model?.data[indexPath.row].result[indexPath.row].name
            foodCell.titleLabel.text = CateModel?.data.result[indexPath.row].name
            foodCell.foodImage.image = UIImage(named: "imgBunsik")
            return foodCell
        } else {
            guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuSelectCell.identifier, for: indexPath) as? MenuSelectCell
                else { return UICollectionViewCell() }
            menuCell.set(menuList[indexPath.row])
                return menuCell
        }
    }
    
}
extension CategoryDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StoreModel?.data.result.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let storeCell = tableView.dequeueReusableCell(withIdentifier: StoreListCell.identifier, for:
        indexPath) as? StoreListCell else { return UITableViewCell() }
        storeCell.StoreNameLabel.text = StoreModel?.data.result[indexPath.row].name
        storeCell.DeliveryTimeLabel.text = String(StoreModel?.data.result[indexPath.row].avgDeliveryTime ?? 0)+"분"
        storeCell.StoreExplainTextView.text = StoreModel?.data.result[indexPath.row].introduce
        storeCell.StoreImageView.setImageCupang(StoreModel?.data.result[indexPath.row].picture)
        storeCell.StarPointLabel.text = String(StoreModel?.data.result[indexPath.row].rating ?? 0)
        storeCell.MeterLabel.text = "• "+String(StoreModel?.data.result[indexPath.row].distance ?? 0)
        if StoreModel?.data.result[indexPath.row].cheetaDelivery == 1 {
            storeCell.ChitaImageView.image = UIImage(named : "imgChitadellivery")
        }
        return storeCell
    }
    
    
}
extension CategoryDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension CategoryDetailViewController {
    func getCate(){
        CategoryService.shared.categoryloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response = res as! ListPro<DataClass>
                self.CateModel = response
                self.FoodSelectCollectionView.reloadData()
                
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
            
        }
    }
    func getStore() {
        CategoryService.shared.storeloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response = res as! FoodPro<DataClass2>
                self.StoreModel = response
                self.StoreTableView.reloadData()
                
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
            
        }
        
    }
}
