//
//  ViewController.swift
//  AlamaFireTest2
//
//  Created by Андрей on 28.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
// Это сделано на мак!

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    var sessionId: String?
    
    @IBOutlet weak var activityIndLogin: UIActivityIndicatorView!
    
    @IBOutlet weak var labelS: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goSecond(_ sender: Any) {
        activityIndLogin.startAnimating()
        BOFLogin(userName: userName, password: password).fetchTokenKey { (tokenKey) in
            if let tokenKey = tokenKey{
                self.labelS.text = tokenKey
            }
            self.activityIndLogin.stopAnimating()
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

