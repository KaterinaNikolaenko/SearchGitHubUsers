//
//  CellViewModel.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 19.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class CellViewModel {
    
    var id: Int?
   
    init(item: GitHubItem) {
        self.id = item.id
    }
}
