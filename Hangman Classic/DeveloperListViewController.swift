//
//  DeveloperListViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 24.04.2023.
//

import UIKit

final class DeveloperListViewController: UITableViewController {
    
    // MARK: - Private Properties
    private let developers = Developer.getDevInfo()

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = view.frame.height / 10
    }

    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        developers.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developers[section].person.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        developers[section].status.rawValue
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "developer", for: indexPath)
        
        let developer = developers[indexPath.section].person[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        content.textProperties.font = .systemFont(ofSize: 17, weight: .semibold)
        content.secondaryTextProperties.color = .darkGray

        content.text = developer.name
        content.secondaryText = developer.nickName
        content.image = UIImage(named: developer.photo)
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let gitHub = developers[indexPath.section].person[indexPath.row].gitHubLink
        guard let url = URL(string: gitHub) else { return }
        UIApplication.shared.open(url)
    }
}
