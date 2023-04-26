//
//  GameListViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 26.04.2023.
//

import UIKit

final class GameListViewController: UITableViewController {
    
    private let gameDescriptions = GameDescription.getInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = view.frame.height / 8
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameDescriptions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        
        let gameInfo = gameDescriptions[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.imageProperties.maximumSize.height = tableView.rowHeight * 0.8
        content.imageProperties.cornerRadius = tableView.rowHeight / 10
        
        content.textProperties.font = .systemFont(ofSize: 17, weight: .semibold)
        content.secondaryTextProperties.color = .darkGray
        content.textToSecondaryTextVerticalPadding = 10
        
        content.text = gameInfo.game.rawValue
        content.secondaryText = gameInfo.description
        content.image = UIImage(named: gameInfo.gamePhoto)
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let segueID = gameDescriptions[indexPath.row].segueID
        
        performSegue(withIdentifier: segueID, sender: nil)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let hangmanVC = segue.destination as? DifficultyHangmanViewController
        hangmanVC?.gameDescription = gameDescriptions[indexPath.row]
                
        let flagSettingsVC = segue.destination as? FlagSettingsViewController
        flagSettingsVC?.gameDescription = gameDescriptions[indexPath.row]
        
        
    }
  
  
 
}
