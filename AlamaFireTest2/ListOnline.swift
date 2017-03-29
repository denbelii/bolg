//
//  ListOnline.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ListOnline{
    
    let url = urlMain + "/index.php?app=ajax&act=get_online_list"
    var headers: HTTPHeaders {
        if let AUTH_TOKEN = AUTH_TOKEN{
        return [AUTH_TOKEN_KEY : AUTH_TOKEN]
        }
        print("AUTH_TOKEN_KEY is nil")
        return [AUTH_TOKEN_KEY : "Error"]
    }
    
    
    
    func fetchOnlineList(completionHandler: @escaping (_ listProfile: [JSON]?) -> Void) {
        PostRequest.fetchData(url: url, headers: headers) { (json) in
            //print(json[].arrayValue.index(of: "type"))
           var listProfile:[JSON]?
            for item in json[].arrayValue {
                listProfile = item["data"].arrayValue
               // print(item["data"].arrayValue)
            }
            completionHandler(listProfile)
            //print("location = \(listProfile?[0]["location"])")
        }
    }
    
    


}
