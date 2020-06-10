//
//  StoreListCell.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 28/05/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import UIKit

class StoreListCell: UITableViewCell {
    static let identifier: String = "StoreListCell"
    
    @IBOutlet weak var StoreImageView: UIImageView!
    @IBOutlet weak var StoreNameLabel: UILabel!
    @IBOutlet weak var DeliveryTimeLabel: UILabel!
    @IBOutlet weak var StoreExplainTextView: UITextView!
    @IBOutlet weak var StarPointLabel: UILabel!
    @IBOutlet weak var MeterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    /*
    
    func storeInformation(storeImg: String, name: String, time: String, explain: String, point: String, meter: String){
        StoreImageView.image = UIImage(named: storeImg)
        StoreNameLabel.text = name
        DeliveryTimeLabel.text = time
        StoreExplainTextView.text = explain
        StarPointLabel.text = point
        MeterLabel.text = meter
    }
*/
}
