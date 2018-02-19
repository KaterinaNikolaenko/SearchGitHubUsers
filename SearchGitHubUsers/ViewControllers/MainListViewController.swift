//
//  ViewController.swift
//  SearchGitHubUsers
//
//  Created by Katerina on 18.02.18.
//  Copyright © 2018 Katerina. All rights reserved.
//

import UIKit

class MainListViewController: UIViewController {
    
    //UI
    let tableView = UITableView()
    
    //Data Source
    var searchResultsViewModel = SearchResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        setTableView()
        
        searchResultsViewModel.getGitHubItems { [unowned self] (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Private

extension MainListViewController {
    
    fileprivate func setTableView() {
        
        tableView.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "cellUser")
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "cellRepository")
        self.view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension MainListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsViewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = searchResultsViewModel.viewModelTypeOfCell(at: indexPath.row)
        if cellIdentifier == "cellUser" {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UserTableViewCell
            let currentUser = searchResultsViewModel.viewModelForCell(at: indexPath.row)
            cell.setUserData(user: currentUser as! UserCellViewModel)
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! RepositoryTableViewCell
            let currentRepository = searchResultsViewModel.viewModelForCell(at: indexPath.row)
            cell.setRepositoryData(repository: currentRepository as! RepositoryCellViewModel)
            return cell
        }
    }
}

// MARK: -  UITableViewDelegate

extension MainListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

