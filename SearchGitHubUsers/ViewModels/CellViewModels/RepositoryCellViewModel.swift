//
//  RepositoryCellViewModel.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 19.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class RepositoryCellViewModel: CellViewModel {
    
    var name: String?
    var fullName: String?
    var description: String?
    var language: String?
    var forksСount: Int?
    var watchersСount: Int?
    
    init(repository: Repository) {
        super.init(item: repository)
        
        self.name = repository.name
        self.fullName = repository.fullName
        self.description = repository.description
        self.language = repository.language
        self.forksСount = repository.forksСount
        self.watchersСount = repository.watchersСount
    }
}
