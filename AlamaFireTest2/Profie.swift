//
//  Profie.swift
//  AlamaFireTest2
//
//  Created by Nataliia Klemenchenko on 30.03.17.
//  Copyright © 2017 tingoit. All rights reserved.
//

import Foundation
import SwiftyJSON

let null = "null"
class Profile {
    
    let id: Int?
    let name: String?
    let gender: String?
    let age: Int?
    let weight: String?
    let photoURL: URL?
    let description: String?
    let location: String?
    let height: String?
    
    init(id: String?, name: String?, gender: String?, age: String?, weight: String?, photo: String?, description: String?, location: String?, height: String?) {
        if let id = id{
            self.id = (id == null || id == "") ? nil : Int(id)
        } else{
            self.id = nil
        }
        
        self.name = name == null ? nil : name
        self.gender = (gender == null || gender == "") ? nil : gender
        
        if let age = age{
            self.age = (age == null || age == "") ? nil : Int(age)
        } else{
            self.age = nil
        }
        
        self.weight = weight == null ? nil : weight
        
        
        if let photo = photo{
            self.photoURL = photo == null ? nil : URL(string: urlPrefixMainPhoto + photo)
        } else{
            self.photoURL = nil
        }
        
        self.description = description == null ? nil : description
        self.location = location == null ? nil : location
        self.height = height == null ? nil : height
    }
    
    convenience init(json: JSON){
        self.init(id: json["id"].string, name: json["name"].string, gender: json["gender"].string, age: json["age"].string, weight: json["weight"].string, photo: json["photo"].string, description: json["description"].string, location: json["gender"].string, height: json["height"].string)
    }
}
