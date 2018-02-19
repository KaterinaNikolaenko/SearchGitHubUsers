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
    private let tableView = UITableView()
    private var itemsSearchBar = UISearchBar()
    
    //Data Source
    var searchResultsViewModel = SearchResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setTableView()
        
        itemsSearchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Private

extension MainListViewController  {
    
    fileprivate func setUI() {
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.barStyle = .blackTranslucent
        self.title = "Users and repositories"
        
        itemsSearchBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50)
        itemsSearchBar.showsCancelButton = true
        itemsSearchBar.placeholder = "Input text"
        itemsSearchBar.tintColor = UIColor.CustomColors.darkBlue
        itemsSearchBar.searchBarStyle = UISearchBarStyle.default
        
        self.view.addSubview(itemsSearchBar)
    }
    
    fileprivate func setTableView() {
        
        tableView.frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "cellUser")
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "cellRepository")
        self.view.addSubview(tableView)
    }
    
    func updateData() {
        searchResultsViewModel.getGitHubItems(query: self.searchResultsViewModel.query) { [unowned self] (success) in
            if success {
                self.tableView.reloadData()
            }
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellIdentifier = searchResultsViewModel.viewModelTypeOfCell(at: indexPath.row)
        if cellIdentifier == "cellUser" {
            let userPortfolioViewController = UserPortfolioViewController()
            userPortfolioViewController.userCellViewModel = searchResultsViewModel.viewModelForCell(at: indexPath.row) as? UserCellViewModel
            userPortfolioViewController.view.backgroundColor = .white
            navigationController?.pushViewController(userPortfolioViewController, animated: true)
        }
    }
}

// MARK: -  UISearchBarDelegate

extension MainListViewController : UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
       
        itemsSearchBar.text = ""
        searchResultsViewModel.query = ""
        updateData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        self.searchResultsViewModel.query = searchText
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchCompleted), object: nil)
        self.perform(#selector(searchCompleted), with: nil, afterDelay: 0.5)
    }
    
    @objc func searchCompleted() {
        self.updateData()
    }
}
