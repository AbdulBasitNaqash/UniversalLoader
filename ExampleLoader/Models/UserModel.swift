//
//  UserModel.swift
//  MindValleyLoader
//
//  Created by Abdul Basit on 23/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import Foundation

struct UserModel:Codable{
    var id:String
    var username:String
    var name:String
    var profile_image:ProfileImageModel
}

struct ProfileImageModel:Codable{
    var small:String
    var medium:String
    var large:String
}
