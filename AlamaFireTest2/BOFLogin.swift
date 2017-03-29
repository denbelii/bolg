//
//  BOFLogin.swift
//  AlamaFireTest2
//
//  Created by Андрей on 28.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import Foundation
import Alamofire

class BOFLogin{
    
    let loginUrl = urlMain + "/api/index.php?app=default&act=login"
    
    let userName: String
    let password: String
    var sessionId: String?
    var parameters: Parameters{
        return ["user_name": self.userName, "password": self.password]
    }
    
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
        
    }
    
    
    func fetchTokenKey(completionHandler: @escaping (_ result: String?) -> Void) {
        
        Alamofire.request(self.loginUrl, method: .post, parameters: self.parameters)
            .responseJSON{ (response) -> Void in
                
                
                    if response.result.isSuccess{
                        if let JSON = response.result.value,
                            let JSONDict = JSON as? [String: AnyObject],
                            let sessionIdDict = JSONDict["data"] as? [String: AnyObject],
                            let sessionIdIn = sessionIdDict["session_id"] as? String{
                            print("response.result.value = \(response.result.value)")
                            completionHandler(sessionIdIn)
                            //print("self.sessionId = \(self.sessionId)")
                        }else{
                            print("response.result.value = \(response.result.value)")
                        }
                        
                    }else{
                        print("Error while fetching remote rooms: \(response.error.debugDescription)")
                        return
                    }
                
                
                
            }
        }
        
}
