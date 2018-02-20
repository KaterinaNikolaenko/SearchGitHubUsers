//
//  Starred.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 20.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

import ObjectMapper

class Starred: Mappable {
    
    var id: Int = 0
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
    }
}
