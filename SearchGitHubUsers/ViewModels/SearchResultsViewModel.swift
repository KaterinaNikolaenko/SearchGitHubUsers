//
//  ItemsViewModels.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class SearchResultsViewModel: NSObject {
    
    var itemsArray = [GitHubItem]()
    var numberOfRowsInSection = 0
    
    // private
    fileprivate var httpClient:HttpClient = HttpClient()
    
    // Get all items from GitHubAPI
    func getGitHubItems(completion: @escaping (Bool) -> ()) {
//        httpClient.getUsers(successCallback: { [unowned self] (itemsArray) -> Void  in
//            self.itemsArray = itemsArray
//            self.numberOfRowsInSection = itemsArray.count
//            completion(true)
//        }) { (error) -> Void in
//            completion(false)
//        }
        
        httpClient.getRepositories(successCallback: { [unowned self] (itemsArray1) -> Void  in
            self.itemsArray = itemsArray1
            self.numberOfRowsInSection = itemsArray1.count
            completion(true)
        }) { (error) -> Void in
            completion(false)
        }
    }
    
    func viewModelForCell(at index: Int) -> UserCellViewModel {
        return UserCellViewModel(user: itemsArray[index] as! User)
    }
}
