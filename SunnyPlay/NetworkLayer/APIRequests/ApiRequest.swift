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

class ApiRequest<ResultType:Mappable, ErrorType:Error> {
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
    
    func execute() -> Future<ResultType?, NoError> {
        return Future { complete in
            Alamofire.request(path, headers: headers)
                .validate(statusCode: 200..<300)
                .responseObject { (response: DataResponse<ResultType>) in
                    switch response.result{
                    case .success(let result):
                        complete(.success(result))
                    case .failure(let error):
                        print("error: \(error)")
                        complete(.success(nil))
                    }
            }
        }
    }
}
