//
//  ItemsViewModels.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class SearchResultsViewModel: NSObject {
    
    var query = ""
    var itemsArray = [GitHubItem]()
    var usersArray = [GitHubItem]()
    var repositoriesArray = [GitHubItem]()
    var numberOfRowsInSection = 0
    let group = DispatchGroup()
    
    // private
    fileprivate var httpClient:HttpClient = HttpClient()
    
    // Get all items from GitHubAPI
    func getGitHubItems(query: String, completion: @escaping (Bool) -> ()) {
        
        group.enter()
        httpClient.getUsers(query: query, successCallback: { [unowned self] (itemsArray) -> Void  in
            self.usersArray = itemsArray
            self.group.leave()
        }) { (error) -> Void in
            self.usersArray.removeAll()
            self.group.leave()
        }
        
        group.enter()
        httpClient.getRepositories(query: query, successCallback: { [unowned self] (itemsArray) -> Void  in
            self.repositoriesArray = itemsArray
            self.group.leave()
        }) { (error) -> Void in
            self.repositoriesArray.removeAll()
            self.group.leave()
        }
        
        group.notify(queue: .main) {
            self.itemsArray = self.usersArray + self.repositoriesArray
            self.itemsArray = self.itemsArray.sorted(by: { $0.id < $1.id })
            self.numberOfRowsInSection = self.itemsArray.count
            completion(true)
        }
    }
    
    func viewModelForCell(at index: Int) -> CellViewModel {
        
        if let _ = itemsArray[index] as? User {
            return UserCellViewModel(user: itemsArray[index] as! User)
        } else {
            return RepositoryCellViewModel(repository: itemsArray[index] as! Repository)
        }
    }
    
    func viewModelTypeOfCell(at index: Int) -> String {
        
        if let _ = itemsArray[index] as? User {
            return "cellUser"
        } else {
            return "cellRepository"
        }
    }
}
