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
import Result

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
        GetCustomerByIdApiRequest(id: "2").execute().onSuccess { (customer) in

        }
    }
 
}

