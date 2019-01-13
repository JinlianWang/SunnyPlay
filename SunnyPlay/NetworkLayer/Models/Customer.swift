//
//  Customer.swift
//  SunnyPlay
//
//  Created by Sunny Wang on 1/12/19.
//  Copyright © 2019 Sunny Wang. All rights reserved.
//

import ObjectMapper

class Customer: Mappable {
    var firstName: String?
    var lastName: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        firstName <- map["firstName"]
        lastName <- map["lastName"]
    }
}
