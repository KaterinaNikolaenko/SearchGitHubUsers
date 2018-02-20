//
//  PortfolioViewModel.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 20.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation

class PortfolioViewModel: NSObject {
    
    // private
    fileprivate var httpClient:HttpClient = HttpClient()
    
    func getUserDetails(userCellViewModel: UserCellViewModel, completion: @escaping (Bool, UserCellViewModel?) -> ()) {
        
        httpClient.getUserDetails(userURL: (userCellViewModel.urlDetails)!, successCallback: { (CurrentUser) -> Void in
            userCellViewModel.fullName = CurrentUser.fullName
            userCellViewModel.followers = CurrentUser.followers
            userCellViewModel.publicRepos = CurrentUser.publicRepos
            userCellViewModel.starredUrl = (userCellViewModel.urlDetails)! + "/starred"
            completion(true, userCellViewModel)
        }) { (error) -> Void in
            completion(false, nil)
        }
    }
    
    func getUserStarts(userCellViewModel: UserCellViewModel, completion: @escaping (Bool, String?) -> ()) {
        
        self.httpClient.getUserStarts(starredURL: (userCellViewModel.starredUrl!), successCallback: { (numberStarts) -> Void in
            completion(true, numberStarts)
        }, errorCallback: { (error) -> Void in
            completion(false, nil)
        })
    }
}
