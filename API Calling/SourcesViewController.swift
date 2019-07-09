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
        let query = "https://nflarrest.com/api/v1/player"
        if let url = URL(string: query) {
            print("this works")
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                parse(json: json)
                return
            }
        }
        loadError()
    }
    
    func parse(json: JSON) {
        for result in json["sources"].arrayValue {
            let Name = result["Name"].stringValue
            let Team = result["Team"].stringValue
            let Team_name = result["Team_name"].stringValue
            let Team_city = result["Team_city"].stringValue
            let Position = result["Position"].stringValue
            let arrest_count = result["arrest_count"].stringValue
            let source = ["Name": Name, "Team": Team, "Team_name": Team_name, "Team_city": Team_city, "Position": Position, "arrest_count": arrest_count]
            sources.append(source)
        }
        tableView.reloadData()
    }
    
    func loadError() {
        let alert = UIAlertController(title: "Loading Error", message: "There was a problem loading the criminal list", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let source = sources[indexPath.row]
        cell.textLabel?.text = source["Name"]
        cell.detailTextLabel?.text = source["Team"]
        return cell
    }
}

