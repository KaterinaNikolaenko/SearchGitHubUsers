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
    
    static let sharedInstance = HttpClient()
    
    var clientID: String = "fd574e31c493c01de944"
    var clientSecret: String = "f87d2033cac47ad73327fa7eb2541d53b8c1e126"
    
    func setHeaders() -> [String:String]? {
        if UserDefaults.standard.string(forKey: "access_token") != nil {
            let headers = [
                "Authorization": "token \(UserDefaults.standard.string(forKey: "access_token")!)"
            ]
            return headers
        } else {
            return nil
        }
    }
    
    func startOAuth2Login()
    {
        let authPath:String = "https://github.com/login/oauth/authorize?client_id=\(clientID)&scope=repo&state=TEST_STATE"
        if let authURL:URL = URL(string: authPath)
        {
            UIApplication.shared.open(authURL, options: [:], completionHandler: nil)
        }
    }
    
    func getUsers(query: String, successCallback: @escaping ([User]) -> (), errorCallback: @escaping (String) -> ()){
        
        if query == "" {
           errorCallback("Error!")
           return
        }
        Alamofire.request(Constants.URLs.usersURL + query, headers: setHeaders()).responseArray(keyPath: "items", completionHandler: { (response: DataResponse<[User]>) in
            
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
        Alamofire.request(Constants.URLs.repositoriesURL + query, headers: setHeaders()).responseArray(keyPath: "items", completionHandler: { (response: DataResponse<[Repository]>) in
            
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
        Alamofire.request(userURL, headers: setHeaders()).responseObject { (response: DataResponse<User>) in
            
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
    
    func getUserStarts(starredURL: String, successCallback: @escaping (Int) -> (), errorCallback: @escaping (String) -> ()){
        
        if starredURL == "" {
            errorCallback("Error!")
            return
        }
        Alamofire.request(starredURL, headers: setHeaders()).responseArray(completionHandler: { (response: DataResponse<[Starred]>) in
            
            guard response.response != nil else {
                errorCallback("Error!")
                return
            }
            if response.result.value != nil {
                successCallback((response.result.value?.count)!)
            }
        })
    }
    
    func processOAuthStep1Response(url: NSURL)
    {
        print(url)
        let components = NSURLComponents(url: url as URL, resolvingAgainstBaseURL: false)
        var code:String?
        if let queryItems = components?.queryItems
        {
            for queryItem in queryItems
            {
                if (queryItem.name.lowercased() == "code")
                {
                    code = queryItem.value
                    break
                }
            }
        }
        if let receivedCode = code {
            print("receivedCode\(receivedCode)")
            let getTokenPath:String = "https://github.com/login/oauth/access_token"
            let tokenParams = ["client_id": clientID, "client_secret": clientSecret, "code": receivedCode]
            Alamofire.request(getTokenPath, method: .post, parameters: tokenParams).responseString(completionHandler: { (response) in
                if let anError = response.error
                {
                    print(anError)
                }
                let results = response.result.value
                if let receivedResults = results
                {
                    let resultParams = receivedResults.split(separator: "&")
                    let resultsSplit = resultParams[0].split(separator: "=")
                    
                    UserDefaults.standard.set(resultsSplit[1], forKey: "access_token")
                }
            })
        }
    }
}
