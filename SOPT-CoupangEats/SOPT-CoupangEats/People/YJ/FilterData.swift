//
//  FilterData.swift
//  SOPT-CoupangEats
//
//  Created by Yunjae Kim on 2020/06/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation

struct FilterData : Codable{
    var status :Int
    var success : Bool
    var message : String
    var data : Results?
    
    init(from decoder : Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(Results.self, forKey: .data)) ?? nil

    }
    
    
    
    
}

struct Results : Codable{
    var result : [FilterResultData]?
    init(from decoder : Decoder) throws{
          let values = try decoder.container(keyedBy: CodingKeys.self)
          result = (try? values.decode([FilterResultData].self, forKey: .result)) ?? nil
    }
    
    
}


struct FilterResultData : Codable{
    var idx : Int
    var sub_category_idx : Int
    var name: String
    var addresss : String
    var avg_delivery_time: Int
    var cheeta_delivery: Int
    var rating : Int
    var introduce : String
    var picture : String
    var delivery_fee : Int
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        idx = (try? values.decode(Int.self, forKey: .idx)) ?? -1
        sub_category_idx = (try? values.decode(Int.self, forKey: .sub_category_idx)) ?? -1
        name = (try? values.decode(String.self, forKey: .name)) ?? ""
        addresss = (try? values.decode(String.self, forKey: .addresss)) ?? ""
        avg_delivery_time = (try? values.decode(Int.self, forKey: .avg_delivery_time)) ?? -1
        cheeta_delivery = (try? values.decode(Int.self, forKey: .cheeta_delivery)) ?? -1
        rating = (try? values.decode(Int.self, forKey: .rating)) ?? -1
        introduce = (try? values.decode(String.self, forKey: .introduce)) ?? ""
        picture = (try? values.decode(String.self, forKey: .picture)) ?? ""
        delivery_fee = (try? values.decode(Int.self, forKey: .delivery_fee)) ?? -1
        
       
    }
    
    
    
    
}
