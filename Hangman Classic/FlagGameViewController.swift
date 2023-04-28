//
//  FlagGameViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 25.04.2023.
//

import UIKit

final class FlagGameViewController: UIViewController {
     
    var countryFlag: CountryFlag!
    
    var score = 0
    
    var lives = 5
    
    var currentButton = UIButton()
    var mistakesCount = 0 
    var progress: Float = 1

    @IBOutlet private var counrtyLabel: UILabel!
    @IBOutlet private var countLabel: UILabel!
    @IBOutlet private var buttons: [UIButton]!
    @IBOutlet var circleView: UIView!
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var liveImages: [UIImageView]!
    
    @IBOutlet private var continentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continentLabel.text = countryFlag.place.rawValue
        
        progressView.progress = progress
        refreshTask()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        circleView.layer.cornerRadius = circleView.bounds.height / 2
        circleView.layer.borderWidth = 2
        circleView.layer.borderColor = UIColor.opaqueSeparator.cgColor
    }
    
    
    
    private func refreshTask() {
        countLabel.text = "\(score)"
        setupButtons()

        
        counrtyLabel.text = countryFlag.countries.keys.randomElement()

        currentButton = buttons.randomElement()!

        currentButton.configuration?.background.image = UIImage(
            named: (countryFlag.countries[counrtyLabel.text!]!.lowercased())
        )
        
        // Убрать
        currentButton.setTitle(countryFlag.countries[counrtyLabel.text!]!, for: .normal)
    }
    
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == currentButton.tag {
            score += 1
            
            
            
            
            switch lives {
            case ..<5:
                progress += 0.2
                
                if progress == 1 {
                    lives += 1
                    
                    liveImages.forEach { liveImage in
                        if liveImage.tag == lives {
                            liveImage.alpha = 1
                        }
                    }
                    lives = min(lives, 5)
                    
                    
                    if lives == 5 {
                        progress = 1
                    } else {
                        progress = 0
                    }
                    
                
                    
                }
                
                progressView.setProgress(progress, animated: true)
                
              
                
                print("Progress: \(progress)  |  Lives: \(lives)")
                
                
            default:
                lives = 5
                
                print("Progress: \(progress)  |  Lives: \(lives)")
            }
            
            
            
            
            
            
            
            
            
        } else {
            mistakesCount += 1
            
            liveImages.forEach { liveImage in
                if liveImage.tag == lives {
                    liveImage.alpha = 0.2
                }
            }
            
            lives -= 1
            lives = max(lives, 0)
            
            progress = 0
            progressView.setProgress(progress, animated: true)
            
            print("Progress: \(progress)  |  Lives: \(lives)")
        }
        refreshTask()
    }
    
    
    
    
    
    private func setupButtons() {
        buttons.forEach { button in
            let countryIndex = countryFlag.countries.values.randomElement()!.lowercased()
            button.configuration?.background.image = UIImage(named: countryIndex)

            button.setTitle(countryIndex, for: .normal)
        }
    }
    
    
    
    
}
