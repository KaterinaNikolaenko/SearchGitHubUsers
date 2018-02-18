//
//  Repository.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation
import ObjectMapper

class Repository: GitHubItem {
    
    var name: String?
    var fullName: String?
    var description: String?
    var language: String?
    var forksСount: Int?
    var watchersСount: Int?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        name <- map["name"]
        fullName <- map["full_name"]
        description <- map["description"]
        language <- map["language"]
        forksСount <- map["forks_count"]
        watchersСount <- map["watchers_count"]
    }
}
