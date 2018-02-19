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
    private let fullNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let languageLabel = UILabel()
    private let forksСountLabel = UILabel()
    private let watchersСountLabel = UILabel()
    private let forksImageView = UIImageView()
    private let watchersImageView = UIImageView()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    func setRepositoryData(repository:RepositoryCellViewModel) {
        
        fullNameLabel.text = repository.fullName
        descriptionLabel.text = repository.description
        languageLabel.text = repository.language
        forksСountLabel.text = String(describing: repository.forksСount)
        watchersСountLabel.text = String(describing: repository.watchersСount)
    }
    
    func setUI()  {
        
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        fullNameLabel.textColor = UIColor.CustomColors.darkBlue
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.textColor = UIColor.gray
        descriptionLabel.adjustsFontSizeToFitWidth = false
        descriptionLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        languageLabel.font = UIFont.systemFont(ofSize: 11)
        languageLabel.textColor = UIColor.gray
        
        forksСountLabel.font = UIFont.systemFont(ofSize: 11)
        forksСountLabel.textColor = UIColor.gray
        
        watchersСountLabel.font = UIFont.systemFont(ofSize: 11)
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
            .widthAnchor(equalTo: UIScreen.main.bounds.size.width - 20)
        
        languageLabel
            .leadingAnchor(equalTo: contentView.leadingAnchor, constant: 10)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
        
        forksImageView
            .leadingAnchor(equalTo: languageLabel.trailingAnchor, constant: 10)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
            .heightAnchor(equalTo: 15)
            .widthAnchor(equalTo: 15)
      
        forksСountLabel
            .leadingAnchor(equalTo: forksImageView.trailingAnchor, constant: 5)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
       
        watchersImageView
            .leadingAnchor(equalTo: forksСountLabel.trailingAnchor, constant: 10)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
            .heightAnchor(equalTo: 15)
            .widthAnchor(equalTo: 15)
       
        watchersСountLabel
            .leadingAnchor(equalTo: watchersImageView.trailingAnchor, constant: 5)
            .topAnchor(equalTo: descriptionLabel.bottomAnchor, constant: 5)
    }
}
