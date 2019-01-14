//
//  ApiRequest.swift
//  SunnyPlay
//
//  Created by Sunny Wang on 1/13/19.
//  Copyright © 2019 Sunny Wang. All rights reserved.
//

import enum Result.Result
import AlamofireObjectMapper
import ObjectMapper
import Alamofire
import Result
import BrightFutures

class ApiRequest<ResultType:Mappable> {
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
    
    func execute() -> Future<ResultType? , ApiError> {
        let promise = Promise<ResultType?, ApiError>()
        Alamofire.request(path, headers: headers)
            .validate(statusCode: 200..<300)
            .responseObject { (response: DataResponse<ResultType>) in
                switch response.result{
                case .success(let result):
                    promise.success(result)
                case .failure(let error):
                    print("error: \(error)")
                    promise.failure(error as! ApiError)
                }
        }
        return promise.future
    }
}
