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
    var SubModel: ListPro<DataClass3>?
    
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
    
   // private var isSelected: [Bool] = Array(repeating: false, count: 5)
    
    //private var foodList: [FoodList] = []
    //private var menuList: [MenuList] = []
    //private var storeList: [StoreInformation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCate()
        getStore()
        getSub(id: 1)
        FoodSelectCollectionView.delegate = self
        FoodSelectCollectionView.dataSource = self
        MenuSelectCollectionView.delegate = self
        MenuSelectCollectionView.dataSource = self
        StoreTableView.delegate = self
        StoreTableView.dataSource = self
        
        setNaviTitle()
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

    private func setNaviTitle() {
        guard let title = self.title else {return}
        navigationController?.navigationBar.topItem?.title = title
    }
    

}
extension CategoryDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cells = collectionView.cellForItem(at: indexPath) as? FoodSelectCell
        navigationController?.navigationBar.topItem?.title = cells?.titleLabel.text
        getSub(id: CateModel?.data.result[indexPath.row].idx ?? -1)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    indexPath: IndexPath) -> CGSize {
        if collectionView == FoodSelectCollectionView {
        return CGSize(width: collectionView.frame.width / 6, height: (collectionView.frame.width / 6)+50+8)
        } else {
            return CGSize(width: 70 , height: 25)
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
            return SubModel?.data.result.count ?? 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == FoodSelectCollectionView {
        guard let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodSelectCell.identifier, for: indexPath) as? FoodSelectCell
            else { return UICollectionViewCell() }
        //foodCell.set(foodList[indexPath.row])
            //foodCell.titleLabel.text = model?.data[indexPath.row].result[indexPath.row].name
            foodCell.titleLabel.text = CateModel?.data.result[indexPath.row].name
            if CateModel?.data.result[indexPath.row].idx == 1 {
                foodCell.foodImage.image = UIImage(named: "imgBunsik")
            } else if CateModel?.data.result[indexPath.row].name == "치킨" {
                foodCell.foodImage.image = UIImage(named: "imgChicken")
            } else if CateModel?.data.result[indexPath.row].name == "족발/보쌈" {
                foodCell.foodImage.image = UIImage(named: "imgPorkFeet")
            } else if CateModel?.data.result[indexPath.row].name == "찜/탕" {
                foodCell.foodImage.image = UIImage(named: "imgSteamedFood")
            } else if CateModel?.data.result[indexPath.row].name == "구이" {
                foodCell.foodImage.image = UIImage(named: "imgGrilledFood")
            } else {
                foodCell.foodImage.image = UIImage(named: "imgBunsik")}
            return foodCell
        } else {
            guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuSelectCell.identifier, for: indexPath) as? MenuSelectCell
                else { return UICollectionViewCell() }
            menuCell.menuTitleButton.setTitle(SubModel?.data.result[indexPath.row].name, for: .normal)
            //menuCell.set(menuList[indexPath.row])
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
        } else {
            storeCell.ChitaImageView.image = nil
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
    func getSub(id: Int) {
        CategoryService.shared.subcategoryloading(id: id) {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response = res as! ListPro<DataClass3>
                self.SubModel = response
                
                UIView.performWithoutAnimation {
                    //슝X 탁O
                    self.MenuSelectCollectionView.reloadSections(IndexSet(arrayLiteral: 0))
                }
                
                
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
