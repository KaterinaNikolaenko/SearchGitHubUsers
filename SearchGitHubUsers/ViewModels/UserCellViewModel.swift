//
//  ItemCellViewModel.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class UserCellViewModel {
   
    var id: Int?
    var urlDetails: String?
    var avatarUrl: String?
    var login: String?
    var followers: Int?
    var publicRepos: Int?
    
    init(user:User) {
        self.id = user.id
        self.urlDetails = user.urlDetails
        self.avatarUrl = user.avatarUrl
        self.login = user.login
        self.followers = user.followers
        self.publicRepos = user.publicRepos
    }
}