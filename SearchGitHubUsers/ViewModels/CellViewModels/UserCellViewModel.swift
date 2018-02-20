//
//  ItemCellViewModel.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class UserCellViewModel: CellViewModel {
    
    var urlDetails: String?
    var avatarUrl: String?
    var login: String?
    var followers: Int?
    var publicRepos: Int?
    var fullName: String?
    var starreds: Int?
    var starredUrl: String?
    
    init(user:User) {
        super.init(item: user)
        
        self.urlDetails = user.urlDetails
        self.avatarUrl = user.avatarUrl
        self.login = user.login
        self.followers = user.followers
        self.publicRepos = user.publicRepos
        self.fullName = user.fullName
        self.starreds = 0
        self.starredUrl = ""
    }
}
