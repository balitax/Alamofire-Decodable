//  
//  PostView.swift
//  Codablex
//
//  Created by Agus Cahyono on 06/04/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import UIKit

class PostView: UIViewController {

    var viewmodel = PostViewModel()
    
    @IBOutlet weak var indicators: UIActivityIndicatorView!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initViewModel()
    }
    
    func initViewModel() {
        self.viewmodel.updateLoadingStatus = {
            let isLoading = self.viewmodel.isLoading
            if isLoading == true {
                self.indicators.startAnimating()
            } else {
                self.indicators.stopAnimating()
            }
        }
        
        self.viewmodel.reloadTableView = {
            self.tableview.separatorStyle = .singleLine
            self.tableview.reloadData()
        }
        
        self.viewmodel.didGetPost()
        
    }
    
}

extension PostView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewmodel.getNumberRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let data = self.viewmodel.getSingleArray(indexPath: indexPath.row)
        
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.body
        
        return cell
    }
    
}


