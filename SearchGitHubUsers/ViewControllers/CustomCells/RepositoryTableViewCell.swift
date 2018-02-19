//
//  RepositoryTableViewCell.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 19.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    //UI
    let fullNameLabel = UILabel()
    let descriptionLabel = UILabel()
    let languageLabel = UILabel()
    let forksСountLabel = UILabel()
    let watchersСountLabel = UILabel()
    let forksImageView = UIImageView()
    let watchersImageView = UIImageView()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    func setUserData(repository:RepositoryCellViewModel) {
        fullNameLabel.text = repository.fullName
        descriptionLabel.text = repository.description
        languageLabel.text = repository.language
        forksСountLabel.text = String(describing: repository.forksСount)
        watchersСountLabel.text = String(describing: repository.watchersСount)
    }
    
    func setUI()  {
        fullNameLabel.font = Constants.Font.boldFont
        
        descriptionLabel.font = Constants.Font.mainSmallFont
        descriptionLabel.textColor = UIColor.gray
        
        languageLabel.font = Constants.Font.mainSmallFont
        languageLabel.textColor = UIColor.gray
        
        forksСountLabel.font = Constants.Font.mainSmallFont
        forksСountLabel.textColor = UIColor.gray
        
        watchersСountLabel.font = Constants.Font.mainSmallFont
        watchersСountLabel.textColor = UIColor.gray
        
        forksImageView.image = UIImage(named: "branch")
        watchersImageView.image = UIImage(named: "eye")
        
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(languageLabel)
        contentView.addSubview(forksСountLabel)
        contentView.addSubview(watchersСountLabel)
        contentView.addSubview(forksImageView)
        contentView.addSubview(watchersImageView)
        
        fullNameLabel
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .topAnchor(equalTo: contentView.topAnchor, constant: 10)
        
        descriptionLabel
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .topAnchor(equalTo: fullNameLabel.bottomAnchor, constant: 5)
        
        languageLabel
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
        
        forksImageView
            .leadingAnchor(equalTo: languageLabel.trailingAnchor, constant: 3)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
            .heightAnchor(equalTo: 10)
            .widthAnchor(equalTo: 10)
      
        forksСountLabel
            .leadingAnchor(equalTo: forksImageView.trailingAnchor, constant: 3)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
       
        watchersImageView
            .leadingAnchor(equalTo: forksСountLabel.trailingAnchor, constant: 3)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
            .heightAnchor(equalTo: 10)
            .widthAnchor(equalTo: 10)
       
        watchersСountLabel
            .leadingAnchor(equalTo: watchersImageView.trailingAnchor, constant: 3)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
    }
}
