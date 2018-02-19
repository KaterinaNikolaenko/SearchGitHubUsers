//
//  UserPortfolioViewController.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 19.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit
import AlamofireImage

class UserPortfolioViewController: UIViewController {

    //UI
    private let avatarImageView = UIImageView()
    private let loginLabel = UILabel()
    private let fullNameLabel = UILabel()
    private let followersLabel = UILabel()
    private let followersCountLabel = UILabel()
    private let publicReposLabel = UILabel()
    private let publicReposCountLabel = UILabel()
    private let starredLabel = UILabel()
    private let starredCountLabel = UILabel()
    
    //Data Source
    var userCellViewModel: UserCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUI()
        setUserData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Private

extension UserPortfolioViewController  {
    
    fileprivate func setUI() {
        
        self.title = "Portfolio"
        
        loginLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        view.addSubview(loginLabel)
        view.addSubview(avatarImageView)
        
        avatarImageView
            .centerXAnchor(equalTo: view.centerXAnchor)
            .topAnchor(equalTo: view.topAnchor, constant: 60)
            .heightAnchor(equalTo: 170)
            .widthAnchor(equalTo: 170)
       
        loginLabel
            .centerXAnchor(equalTo: view.centerXAnchor)
            .topAnchor(equalTo: avatarImageView.bottomAnchor, constant: 15)
    }
    
    fileprivate func setUserData() {
        
        loginLabel.text = userCellViewModel?.login
        avatarImageView.af_setImage(withURL: URL(string: (userCellViewModel?.avatarUrl)!)!, placeholderImage: UIImage(named: "placeholder"))
    }
}
