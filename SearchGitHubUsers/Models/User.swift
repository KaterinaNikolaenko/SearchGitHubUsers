//
//  User.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation
import ObjectMapper

class User: GitHubItem {
    
    var urlDetails: String?
    var avatarUrl: String?
    var login: String?
    var followers: Int?
    var publicRepos: Int?
    var fullName: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        urlDetails <- map["url"]
        avatarUrl <- map["avatar_url"]
        login <- map["login"]
        followers <- map["followers"]
        publicRepos <- map["public_repos"]
        fullName <- map["name"]
    }
}
