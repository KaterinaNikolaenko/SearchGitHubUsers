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
    
    func getUserDetails(userURL: String, successCallback: @escaping (User) -> (), errorCallback: @escaping (String) -> ()){
        
        if userURL == "" {
            errorCallback("Error!")
            return
        }
        Alamofire.request(userURL).responseObject { (response: DataResponse<User>) in
            
            guard response.response != nil else {
                errorCallback("Error!")
                return
            }
            if (response.result.isSuccess) {
                successCallback(response.result.value!)
            } else {
                errorCallback("Error!")
            }
        }
    }
    
    func getUserStarts(starredURL: String, successCallback: @escaping (String) -> (), errorCallback: @escaping (String) -> ()){
        
        if starredURL == "" {
            errorCallback("Error!")
            return
        }
        Alamofire.request(starredURL).responseArray(completionHandler: { (response: DataResponse<[Starred]>) in
            
            guard response.response != nil else {
                errorCallback("Error!")
                return
            }
            if let linkHeader = response.response?.allHeaderFields["Link"] as? String {
                let components = linkHeader.split {$0 == ","}.map { String($0) }
                for item in components {
                    let rangeOfLast = item.range(of: "rel=\"last\"", options: [])
                    if rangeOfLast != nil {
                        let rangeOfPaddedURL = item.range(of: "<(.*)>;", options: .regularExpression)
                        if let range = rangeOfPaddedURL {
                            let lastURL = String(item[range])
                            var startIndex = lastURL.index(lastURL.startIndex, offsetBy: 0)
                            var endIndex = lastURL.index(lastURL.startIndex, offsetBy: lastURL.count - 2)
                            var urlRange = startIndex..<endIndex
                            let tempUrl = String(lastURL[urlRange])
                            startIndex = tempUrl.index(of: "=")!
                            startIndex = tempUrl.index(after: startIndex)
                            endIndex = tempUrl.index(tempUrl.startIndex, offsetBy: tempUrl.count)
                            urlRange = startIndex..<endIndex
                            successCallback(String(tempUrl[urlRange]))
                        } else {
                            errorCallback("Error!")
                        }
                    } else {
                        errorCallback("Error!")
                    }
                }
            } else {
                errorCallback("Error!")
            }
        })
    }
}
