//
//  GetRequest.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetRequest {
    
    class func fetchDataWithTokenInHeader(url: String, parameters: Parameters, completionHandler: @escaping (_ json: JSON) -> Void){
        if let AUTH_TOKEN = AUTH_TOKEN{
            let headers: HTTPHeaders = [
                AUTH_TOKEN_KEY : AUTH_TOKEN
            ]
            print("AUTH_TOKEN_KEY = \(AUTH_TOKEN_KEY)")
            let req = Alamofire.request(url, method: .get, headers: headers).responseJSON { response in
                print("response.data = \(response.data)")
                if response.result.isSuccess{
                    if let data = response.data{
                        completionHandler(JSON(data: data))
                        print("data = \(JSON(data: data))")
                    } else{
                        print("что то с данными для джейсон")
                    }
                }else{
                    print("Error while fetching: \(response.error.debugDescription)")
                    return
                }
            }
            debugPrint(req)
        }
    }
    
}
