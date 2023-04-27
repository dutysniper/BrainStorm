//
//  StatsListViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 27.04.2023.
//

import UIKit

final class StatsListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = view.frame.height / 12
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        
        content.text = "srg"
        
        cell.contentConfiguration = content
        
        return cell
    }
}
