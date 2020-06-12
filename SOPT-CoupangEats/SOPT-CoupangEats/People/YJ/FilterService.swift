//
//  FilterService.swift
//  SOPT-CoupangEats
//
//  Created by Yunjae Kim on 2020/06/12.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import Alamofire


struct FilterService{
    static let shared = FilterService()
    static var filteredDatas : [FilterResultData] = []
    

    
    private func makeParameters(time_min : Int, time_max : Int, money_min : Int, money_max : Int, sort_type : String)->Parameters{
        return ["time_min" : time_min, "time_max" : time_max, "money_min" : money_min, "money_max" : money_max, "sort_type" : sort_type]
        
        
        
    }
    
    func filtering(time_min : Int, time_max : Int, money_min : Int, money_max : Int, sort_type : String,completion : @escaping (NetworkResult<Any>)->Void){
        
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.filterURL, method: .post, parameters: makeParameters(time_min: time_min, time_max: time_max, money_min: money_min, money_max: money_max, sort_type: sort_type), encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData{ dataResponse in
            switch dataResponse.result{
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.result.value else {return}
                print(statusCode)
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
                
                
            case .failure : completion(.networkFail)
                
                
                
                
            }
            
            
        }
        
        
    }
    
    
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return filtered(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail }
    }

    private func filtered(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(FilterData.self, from: data) else { return .pathErr }
        guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
        
        let results = decodedData.data?.result
        
        for res in results!{
            FilterService.filteredDatas.append(res)
        }
        
        
        
        return .success(tokenData)
    }
    
    
    
    
}

