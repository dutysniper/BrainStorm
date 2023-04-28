//
//  ThemeTableViewCell.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 28.04.2023.
//

import UIKit

final class ThemeTableViewCell: UITableViewCell {
    
    @IBAction func themeToggle(_ sender: UISwitch) {
        window?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
    }
}
