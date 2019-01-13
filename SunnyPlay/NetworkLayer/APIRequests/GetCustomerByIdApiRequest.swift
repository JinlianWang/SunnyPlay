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

class GetCustomerByIdApiRequest: ApiRequest<Customer, NoError> {
    
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
}
