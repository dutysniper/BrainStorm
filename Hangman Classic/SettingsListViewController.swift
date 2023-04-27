//
//  SettingsListViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 27.04.2023.
//


struct SettingsButtonTitle {
    let header: String
    let title: [String]
    
    static func getSettingsButtonTitles() -> [SettingsButtonTitle] {
        
        var version = "Не удалось получить версию приложения"
        
        let appVersion = Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString"
        )
        
        if let appVersion = appVersion as? String {
            version = "Version: \(appVersion)"
        }
        
        return [
            SettingsButtonTitle(
                header: "",
                title: [version]
            ),
            SettingsButtonTitle(
                header: "Покупки",
                title: ["Оформить подписку", "Восстановить покупки"]
            ),
            SettingsButtonTitle(
                header: "Обратная связь",
                title: ["Оставить отзыв в AppStore", "Написать на почту"]
            ),
            SettingsButtonTitle(
                header: " ",
                title: ["Разработчики"]
            )
        ]
    }
}

import UIKit

class SettingsListViewController: UITableViewController {
    
//    private let settings = [
//        ["": ["Текущая версия: 1.0"]],
//        ["Покупки": ["Оформить подписку", "Восстановить покупки"]],
//        ["Обратная связь": ["Оставить отзыв в AppStore", "Написать на почту"]],
//        [" ": ["Разработчики"]]
//    ]
    
    private let headersAndTitles = SettingsButtonTitle.getSettingsButtonTitles()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = view.frame.height / 17
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        headersAndTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        headersAndTitles[section].title.count
       
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = headersAndTitles[indexPath.section].title[indexPath.row]
       
        
        
        switch indexPath.section {
        case 0:
            break
        default:
            content.textProperties.font = .boldSystemFont(ofSize: 16)
            content.textProperties.color = .darkGray
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
}
