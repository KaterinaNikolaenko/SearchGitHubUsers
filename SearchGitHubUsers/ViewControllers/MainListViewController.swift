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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MainListViewController: UITableViewDataSource, UITableViewDelegate {
    
    fileprivate func setTableView() {
        
        tableView.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "AAAAAAA"
        
        return cell!
    }
    
}
