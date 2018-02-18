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
    var itemViewModel = ItemViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        setTableView()
        
        itemViewModel.getGitHubItems { [unowned self] (success) in
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
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension MainListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "AAAAAAA"
        
        return cell!
    }
}

// MARK: -  UITableViewDelegate

extension MainListViewController: UITableViewDelegate {
    
}

