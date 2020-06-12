//
//  bannerData.swift
//  SOPT-CoupangEats
//
//  Created by Yunjae Kim on 2020/06/11.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import Alamofire

struct BannerDataFirst : Codable{
    var status : BannerData?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(BannerData.self, forKey: .status)) ?? nil
        
    }
    
    
}


struct BannerData : Codable{
    var status : Int
    var success : Bool
    var message : String
    var data : ResultDatas?
    

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(ResultDatas.self, forKey: .data)) ?? nil
    }

    
    
    
    
}

struct ResultDatas : Codable {
    var result : [ResultData]?

    init(from decoder : Decoder) throws{
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = (try? values.decode([ResultData].self, forKey: .result)) ?? nil
    }
    
    
}

struct ResultData : Codable{
      var idx : Int
      var image : String
      var name : String

      init(from decoder: Decoder) throws {
          let values = try decoder.container(keyedBy: CodingKeys.self)
          idx = (try? values.decode(Int.self, forKey: .idx)) ?? -1
          image = (try? values.decode(String.self, forKey: .image)) ?? ""
          name = (try? values.decode(String.self, forKey: .name)) ?? ""
      }

      
      
  }




//
//struct ResultDatas : Codable{
//
//    var ResultData : ResultData
//
////    var result : ResultToken?
////    var results : [ResultToken]
////     enum CodingKeys: String, CodingKey {
////           case result = "result"
////    }
////
////    init(from decoder: Decoder) throws {
////        let values = try decoder.container(keyedBy: CodingKeys.self)
////        result = (try? values.decode(ResultToken.self, forKey: .result)) ?? nil
////
////    }
//
//
//}
//
//
//
//
//struct ResultData : Codable {
//
//    var idx : Int
//    var image : String
//    var name : String
//
//    enum CodingKeys: String, CodingKey {
//        case idx = "idx"
//        case image = "image"
//        case name = "name"
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        idx = (try? values.decode(Int.self, forKey: .idx)) ?? -1
//        image = (try? values.decode(String.self, forKey: .image)) ?? ""
//        name = (try? values.decode(String.self, forKey: .name)) ?? ""
//    }
//}
