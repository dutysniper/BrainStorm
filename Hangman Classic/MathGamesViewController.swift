//
//  MathGamesViewController.swift
//  Hangman Classic
//
//  Created by Степан Фоминцев on 28.04.2023.
//

import UIKit

class MathGamesViewController: UITableViewController {

    let gamemodes = Gamemodes.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Режим игры"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gamemodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: gamemodes[indexPath.row].rawValue)
        cell.contentConfiguration = content
        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

extension MathGamesViewController {
    enum Gamemodes: String, CaseIterable {
        case time = "timeGame"
        case yesOrNo = "yesOrNoGame"
    }
}
