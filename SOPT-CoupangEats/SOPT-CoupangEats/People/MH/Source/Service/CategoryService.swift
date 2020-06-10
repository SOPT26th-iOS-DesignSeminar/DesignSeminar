//
//  CategoryService.swift
//  SOPT-CoupangEats
//
//  Created by 김민희 on 05/06/2020.
//  Copyright © 2020 남수김. All rights reserved.
//

import Foundation
import Alamofire

struct CategoryService {
    private init() {}
    static let shared = CategoryService()
    func categoryloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.categoryURL
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
                
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(ListPro<DataClass>.self, from: value)
                                
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        default:break
                        }
                    }
                }
            case .failure:completion(.networkFail)
            }
        }
    }
    func storeloading(completion: @escaping (NetworkResult<Any>)->Void) {
        let URL = APIConstants.storeURL
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                let result = try decoder.decode(FoodPro<DataClass2>.self, from: value)
                                
                                completion(.success(result))
                            } catch {
                                completion(.pathErr)
                            }
                        default:break
                        }
                    }
                }
            case .failure:completion(.networkFail)
            }
        }
        
    }
}
