//
//  PostRequest.swift
//  AlamaFireTest2
//
//  Created by Андрей on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostRequest {
    
    class func fetchData(url: String, parameters: Parameters = [:],  headers: HTTPHeaders = [:],completionHandler: @escaping (_ json: JSON) -> Void){
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers)
            .responseJSON{ (response) -> Void in
                if response.result.isSuccess{
                    if let data = response.data{
                        completionHandler(JSON(data: data))
                        //print("data = \(JSON(data: data))")
                    } else{
                        print("что то с данными для джейсон")
                    }
                }else{
                    print("Error while fetching: \(response.error.debugDescription)")
                    return
                }
        }
    }
    
}

