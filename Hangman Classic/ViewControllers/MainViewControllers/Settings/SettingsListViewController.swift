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
        let settingSection = headersAndTitles[indexPath.section]
        
        let settingCell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        guard let themeCell = tableView.dequeueReusableCell(withIdentifier: "themeCell", for: indexPath) as? ThemeTableViewCell else { return settingCell }
        
        themeCell.cellLabel.text = settingSection.title[indexPath.row]
        themeCell.cellImageView.image = UIImage(
            systemName: settingSection.image[indexPath.row]
        )
        themeCell.cellImageView.contentMode = .scaleAspectFit
        themeCell.cellImageView.tintColor = .init(named: "commonColor")
        themeCell.separatorInset.right = themeCell.themeSwitch.frame.width + 32
        themeCell.separatorInset.left = themeCell.cellImageView.frame.width + 12
        
        var content = settingCell.defaultContentConfiguration()
        content.text = settingSection.title[indexPath.row]
        content.image = UIImage(
            systemName: settingSection.image[indexPath.row]
        )
        content.imageProperties.tintColor = .init(named: "commonColor")
        
        switch indexPath.section {
        case 0 where indexPath.row == 0:
            settingCell.accessoryType = .disclosureIndicator
        case 1:
            return themeCell
        case 3:
            settingCell.accessoryType = .disclosureIndicator
        case 4:
            content.textProperties.color = .opaqueSeparator
            settingCell.selectionStyle = .none
            content.textProperties.alignment = .center
        default:
            break
        }
        
        settingCell.contentConfiguration = content
        return settingCell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        headersAndTitles[section].header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.rowHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0 where indexPath.row == 0:
            showOkAlert(title: "Подписок пока нет", message: "")
        case 0 where indexPath.row == 1:
            showOkAlert(title: "Приложение пока бесплатное", message: "")
        case 2 where indexPath.row == 0:
            showOkAlert(title: "Мы скоро будем в AppStore", message: "")
        case 2 where indexPath.row == 1:
            sendMail()
        case 3:
            performSegue(withIdentifier: "showDevelopers", sender: nil)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
