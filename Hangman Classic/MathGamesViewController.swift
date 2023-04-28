//
//  MathGamesViewController.swift
//  Hangman Classic
//
//  Created by Степан Фоминцев on 28.04.2023.
//

import UIKit

final class MathGamesViewController: UITableViewController {
    
    var gameDescription: GameDescription!

    private let gameNames = ["Спринт", "Правда или ложь"]
    private let gameDescriptions = ["10 секунд на правильный ответ", "Определите верное ли выражение"]
    private let gameImages = ["timeGame", "yesOrNoGame"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Режим игры"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)

        var content = cell.defaultContentConfiguration()

        content.imageProperties.maximumSize = CGSize(width: 30, height: 30)
        content.imageProperties.cornerRadius = content.imageProperties.maximumSize.width / 2
        content.textProperties.font = .boldSystemFont(ofSize: 15)
        content.text = gameNames[indexPath.row]
        content.secondaryText = gameDescriptions[indexPath.row]
        content.image = UIImage(named: gameImages[indexPath.row])
        
        cell.contentConfiguration = content
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: performSegue(withIdentifier: "timeGame", sender: nil)
        case 1: performSegue(withIdentifier: "yesOrNoGame", sender: nil)
        default: break
        }
    }
    

}
