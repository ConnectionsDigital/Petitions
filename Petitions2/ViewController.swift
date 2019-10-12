//
//  ViewController.swift
//  Petitions2
//
//  Created by Kenneth Jackson on 9/20/19.
//  Copyright © 2019 Connections Digital. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func parse(json: Data) {
            let decoder = JSONDecoder()
            
            if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
                petitions = jsonPetitions.results
                tableView.reloadData()
            }
        }
        
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
}
