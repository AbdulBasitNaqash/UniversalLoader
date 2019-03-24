//
//  CardModel.swift
//  MindValleyLoader
//
//  Created by Abdul Basit on 23/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import Foundation

struct CardModel:Codable{
    var id:String
    var created_at:String
    var width:Int
    var height:Int
    var color:String
    var likes:Int
    var liked_by_user: Bool
    var user:UserModel
    var urls:URLModel
}

