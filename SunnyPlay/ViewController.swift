//
//  ViewController.swift
//  SunnyPlay
//
//  Created by Sunny Wang on 1/12/19.
//  Copyright © 2019 Sunny Wang. All rights reserved.
//

import UIKit
import Alamofire
import BrightFutures
import AlamofireObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        let customersURL:String = "http://localhost:8080/users/1"
        let headers = [
            "Authorization": "Bearer SunnyWang",
            "Accept": "application/json"
        ]
        Alamofire.request(customersURL, headers: headers)
            .validate(statusCode: 200..<300)
            .responseObject { (response: DataResponse<Customer>) in
                switch response.result{
                case .success(let customer):
                    if customer != nil {
                        print("first name: \(customer.firstName!) last name: \(customer.lastName!)")
                    }
                case .failure(let error):
                    print("error: \(error)")
                }
        }
    }
    
}

