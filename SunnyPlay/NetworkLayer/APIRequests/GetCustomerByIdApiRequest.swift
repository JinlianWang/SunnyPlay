//
//  GetCustomerByIdApiRequest.swift
//  SunnyPlay
//
//  Created by Sunny Wang on 1/13/19.
//  Copyright © 2019 Sunny Wang. All rights reserved.
//

import AlamofireObjectMapper
import Alamofire
import Result
import BrightFutures

class GetCustomerByIdApiRequest: ApiRequest {
    
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
    override var path:String {
        return "http://localhost:8080/users/\(id)"
    }
    
    override var headers: [String : String] {
        return [
            "Authorization": "Bearer SunnyWang",
            "Accept": "application/json"
        ]
    }
    
    func execute() -> Future<Customer?, NoError> {
        return Future { complete in
            Alamofire.request(path, headers: headers)
                .validate(statusCode: 200..<300)
                .responseObject { (response: DataResponse<Customer>) in
                    switch response.result{
                    case .success(let customer):
                        complete(.success(customer))
                    case .failure(let error):
                        print("error: \(error)")
                        complete(.success(nil))
                    }
            }
        }
    }
}
