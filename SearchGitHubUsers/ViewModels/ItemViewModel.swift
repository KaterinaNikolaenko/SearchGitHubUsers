//
//  ItemsViewModels.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class ItemViewModel: NSObject {
    
    var itemsArray = [GitHubItem]()
    
    // private
    fileprivate var httpClient:HttpClient = HttpClient()
    
    
    // Get all items from GitHubAPI
    func getGitHubItems(completion: @escaping (Bool) -> ()) {
        httpClient.getUsers(successCallback: { [unowned self] (itemsArray) -> Void  in
            self.itemsArray = itemsArray
            completion(true)
        }) { (error) -> Void in
            completion(false)
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return itemsArray.count
    }
}
