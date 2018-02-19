//
//  Constants.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct URLs {
        static let usersURL = "https://api.github.com/search/users?q=christiaande"
        static let repositoriesURL = "https://api.github.com/search/repositories?q=tetris"
    }
    
    struct Font {
        static let mainFont = UIFont(name: "Helvetica Neue", size: 18)
        static let boldFont = UIFont(name: "Helvetica Neue", size: 18)?.bold()
        static let mainSmallFont = UIFont(name: "Helvetica Neue", size: 15)
    }
}
