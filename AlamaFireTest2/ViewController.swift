//
//  ViewController.swift
//  AlamaFireTest2
//
//  Created by Андрей on 28.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
// Это сделано на мак!

import UIKit
import Alamofire


class ViewController: UIViewController {
    var sessionId: String?
    
    
    @IBOutlet weak var labelS: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        
        
        
        //print("rrr = \(sessionId)")
        
        
    }
    
    @IBAction func goSecond(_ sender: Any) {
        
        BOFLogin(userName: userName, password: password).fetchTokenKey { (result) in
            self.sessionId = result
            DispatchQueue.main.async {
                self.labelS.text = result
            }
//            print("okAC")
//                let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
//                
//                secondVC.sessionId = result
//                self.navigationController?.pushViewController(secondVC, animated: true)
            
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

