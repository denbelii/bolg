//
//  LadiesOnline.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 30.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LadiesFilters{
    
    let url = urlMain + "/index.php?app=ladies"
    let pageIdentificator = "page"
    
    
    
    
    func fetchOnlineList(page: Int32, completionHandler: @escaping (_ arrayLady: [Lady]?) -> Void) {
        let parameters = [pageIdentificator: page]
        PostRequest.fetchData(url: url, parameters: parameters, headers: headers) { (json) in
            let dictionaryJSON = json.dictionary?["data"]?["list"].dictionaryValue
            //print("dictionaryJSON = \(dictionaryJSON)")
            var arrayLady = [Lady]()
            if let dictionaryJSON = dictionaryJSON{
                for item in dictionaryJSON{
                    let lady = Lady(json: item.value, id: item.key)
                    arrayLady.append(lady)
                }
            }
            print("completionHandler")
            completionHandler(arrayLady)
        }
    }
    
    
    
    
}
