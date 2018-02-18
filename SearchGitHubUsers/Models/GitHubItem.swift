//
//  GitHubItem.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation
import ObjectMapper

class GitHubItem: Mappable {
    
    var id: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
    }
}

