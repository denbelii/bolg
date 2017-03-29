//
//  LoginVC.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var activityIndLogin: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userName
        passwordLabel.text = password
        activityIndLogin.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goInsideLoginButton(_ sender: Any) {
        activityIndLogin.isHidden = false
        activityIndLogin.startAnimating()
        BOFLogin(userName: userName, password: password).fetchTokenKey { (tokenKey) in
            if let tokenKey = tokenKey{
                KeyChain.setToken(tokenKey: tokenKey)
                self.goGallery()
            }
            self.activityIndLogin.stopAnimating()
            self.activityIndLogin.isHidden = true
        }
    }
    
    func goGallery(){
        let gallerySB = self.storyboard?.instantiateViewController(withIdentifier: "LadiesListVC") as! LadiesListVC
        self.navigationController?.pushViewController(gallerySB, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
