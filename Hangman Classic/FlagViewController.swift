//
//  FlagViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 25.04.2023.
//

import UIKit

final class FlagViewController: UIViewController {
    
    let flags = FlagDataStore().flagsAndCourties
    
    var count = 0
    var currentButton = UIButton()
    var mistakesCount = 0

    @IBOutlet var counrtyLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var liveImages: [UIImageView]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        refreshTask()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == currentButton.tag {
            count += 1
        } else {
            liveImages.forEach { liveImage in
                if liveImage.tag == mistakesCount {
                    liveImage.alpha = 0.2
                }
            }
            mistakesCount += 1
        }
        refreshTask()
    }
    
    
    private func refreshTask() {
        countLabel.text = "\(count)"

        buttons.forEach { button in
            let randomElement = flags.values.randomElement()!.lowercased()
            
            button.configuration?.background.image = UIImage(named: randomElement)
            
            button.setTitle(randomElement, for: .normal)
        }
        
        counrtyLabel.text = flags.keys.randomElement()
            
        currentButton = buttons.randomElement()!
        
        currentButton.configuration?.background.image = UIImage(
            named: flags[counrtyLabel.text!]!.lowercased()
        )
        currentButton.setTitle(flags[counrtyLabel.text!]!, for: .normal)
        

        
       
    }
}
