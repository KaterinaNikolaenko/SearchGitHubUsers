//
//  UserTableViewCell.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit
import AlamofireImage

class UserTableViewCell: UITableViewCell {

    //UI
    let loginLabel = UILabel()
    let avatarImageView = UIImageView()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    func setUserData(user:User) {
        loginLabel.text = user.login
        avatarImageView.af_setImage(withURL: URL(string: user.avatarUrl!)!)
    }
    
    func setUI()  {
        loginLabel.font = Constants.Font.boldFont
        
        contentView.addSubview(loginLabel)
        contentView.addSubview(avatarImageView)
        
        avatarImageView
            .centerYAnchor(equalTo: contentView.centerYAnchor)
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .heightAnchor(equalTo: 40)
            .widthAnchor(equalTo: 40)
        
        loginLabel
            .centerYAnchor(equalTo: contentView.centerYAnchor)
            .leadingAnchor(equalTo: avatarImageView.trailingAnchor, constant: 10)
    }
}
