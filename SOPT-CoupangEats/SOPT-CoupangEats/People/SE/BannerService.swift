//
//  BannerService.swift
//  SOPT-CoupangEats
//
//  Created by Yunjae Kim on 2020/06/11.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import Alamofire


struct BannerService{
    static let shared = BannerService()
    static var urls : [String] = []
    
    
    func getBanner(completion : @escaping (NetworkResult<Any>)->Void){
        let header : HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = Alamofire.request(APIConstants.addURL,method: .get,encoding: JSONEncoding.default,headers: header)
        
        dataRequest.responseData{ dataResponse in
            switch dataResponse.result{
            case .success :
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else  { return}
                let networkResult = self.judge(by: statusCode, value)
//                let decoder = JSONDecoder()
//                let bannerData : BannerData = try decoder.decode(BannerData.self, from: value)
                completion(networkResult)
                
                
            case.failure:
                completion(.networkFail)
                
            }
            
            
            
            
        }
        
        
        
        
        
    }
  
    
    
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return banner(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
            
        }
    }

    private func banner(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(BannerDataFirst.self, from: data) else { return .pathErr }
        guard let newdata = decodedData.status?.data else{
            return .requestErr(decodedData.status?.message)
            
        }
        
      
        for d in newdata.result!{
            print(d.idx)
            print(d.image)
            print(d.name)
            
            BannerService.urls.append(d.image)
            
        }
        
        
        
        
        
        return .success(newdata.result)
    }
    
    
}
