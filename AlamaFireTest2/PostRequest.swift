//
//  PostRequest.swift
//  AlamaFireTest2
//
//  Created by Андрей on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import Foundation
import Alamofire

class PostRequest {
    
    class func fetchData(loginUrl: String, parameters: Parameters, completionHandler: (_ result: String?) -> Void){
        Alamofire.request(loginUrl, method: .post, parameters: parameters)
            .responseJSON{ (response) -> Void in
                
                
                if response.result.isSuccess{
                    
                }else{
                    print("Error while fetching remote rooms: \(response.error.debugDescription)")
                    return
                }
                
                
                
        }
    }
    
}

