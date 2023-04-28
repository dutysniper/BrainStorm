//
//  SettingsListViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 27.04.2023.
//

import UIKit

final class SettingsListViewController: UITableViewController {
    
    // MARK: - Private Properties
    private let headersAndTitles = SettingsButtonTitle.getSettingsButtonTitles()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = view.frame.height / 17
    }
}

// MARK: - Table view data source
extension SettingsListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        headersAndTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        headersAndTitles[section].title.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = headersAndTitles[indexPath.section].title[indexPath.row]
        content.image = UIImage(
            systemName: headersAndTitles[indexPath.section].image[indexPath.row]
        )
        content.imageProperties.tintColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
      
        switch indexPath.section {
        case 0 where indexPath.row == 0, 2:
            cell.accessoryType = .disclosureIndicator
        case 3:
            content.textProperties.color = .opaqueSeparator
            cell.selectionStyle = .none
            content.textProperties.alignment = .center
        default:
            break
        }
    
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        headersAndTitles[section].header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        view.frame.height / 20
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            performSegue(withIdentifier: "showDevelopers", sender: nil)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
