//
//  ApiRequest.swift
//  SunnyPlay
//
//  Created by Sunny Wang on 1/13/19.
//  Copyright © 2019 Sunny Wang. All rights reserved.
//

import Alamofire

class ApiRequest {
    var path: String {
        return ""
    }
    
    var queryParameters: [String: String] {
        return [:]
    }
    
    var headers: [String: String] {
        return [:]
    }
    
    var method: HTTPMethod {
        return HTTPMethod.get
    }
}
