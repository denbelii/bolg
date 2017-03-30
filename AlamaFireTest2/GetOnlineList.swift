//
//  ListOnline.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 29.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//
//
import Foundation
import Alamofire
import SwiftyJSON

class GetOnlineList{
    
    let url = urlMain + "/index.php?app=ajax&act=get_online_list"
    
    
    
    func fetchOnlineList(completionHandler: @escaping (_ listProfile: [JSON]?) -> Void) {
        let parametrs:Parameters = [:]
        PostRequest.fetchData(url: url, parameters: parametrs, headers: headers) { (json) in
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
