//
//  ViewController.swift
//  API Calling
//
//  Created by Zhou, Alexander on 7/9/19.
//  Copyright © 2019 Alex Zhou. All rights reserved.
//

import UIKit

class SourcesViewController: UITableViewController {
    
    var sources = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Criminals"
        let query = "http://nflarrest.com/api/v1/player"
    }
}

