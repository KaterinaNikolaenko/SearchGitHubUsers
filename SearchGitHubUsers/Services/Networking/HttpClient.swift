//
//  HttpClient.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class HttpClient {
    
    func getUsers(query: String, successCallback: @escaping ([User]) -> (), errorCallback: @escaping (String) -> ()){
        
        if query == "" {
           errorCallback("Error!")
           return
        }
        Alamofire.request(Constants.URLs.usersURL + query).responseArray(keyPath: "items", completionHandler: { (response: DataResponse<[User]>) in
            
            guard response.response != nil else {
                errorCallback("Error!")
                return
            }
            if (response.result.isSuccess) {
                successCallback(response.result.value!)
            } else {
                errorCallback("Error!")
            }
        })
    }
    
    func getRepositories(query: String, successCallback: @escaping ([Repository]) -> (), errorCallback: @escaping (String) -> ()){
        
        if query == "" {
            errorCallback("Error!")
            return
        }
        Alamofire.request(Constants.URLs.repositoriesURL + query).responseArray(keyPath: "items", completionHandler: { (response: DataResponse<[Repository]>) in
            
            guard response.response != nil else {
                errorCallback("Error!")
                return
            }
            if (response.result.isSuccess) {
                successCallback(response.result.value!)
            } else {
                errorCallback("Error!")
            }
        })
    }
}
