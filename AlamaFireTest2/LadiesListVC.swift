//
//  LadiesGalleryVC.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import UIKit

class LadiesGalleryVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tokenKey = KeyChain.getToken()
        print("tokenKey = \(tokenKey)")
        guard tokenKey != nil else {
            goLogin()
            return
        }
        ListOnline().fetchOnlineList { 
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goLogin(){
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}
