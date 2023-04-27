//
//  FlagGameViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 25.04.2023.
//

import UIKit

final class FlagGameViewController: UIViewController {
     
    var countryFlag: CountryFlag!
    
    var count = 0
    var currentButton = UIButton()
    var mistakesCount = 0
    var progress: Float = 0

    @IBOutlet var counrtyLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
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

    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.tag == currentButton.tag {
            count += 1
            progress += 0.2
            
            progressView.setProgress(progress, animated: true)
        } else {
            liveImages.forEach { liveImage in
                if liveImage.tag == mistakesCount {
                    liveImage.alpha = 0.2
                }
            }
            mistakesCount += 1
            progress = 0
            progressView.setProgress(progress, animated: true)
        }
        refreshTask()
    }
    
    
    private func refreshTask() {
        countLabel.text = "\(count)"

        buttons.forEach { button in
            let randomElement = countryFlag.countries.values.randomElement()!.lowercased()

            button.configuration?.background.image = UIImage(named: randomElement)

            button.setTitle(randomElement, for: .normal)
        }

        counrtyLabel.text = countryFlag.countries.keys.randomElement()

        currentButton = buttons.randomElement()!

        currentButton.configuration?.background.image = UIImage(
            named: (countryFlag.countries[counrtyLabel.text!]!.lowercased())
        )
        currentButton.setTitle(countryFlag.countries[counrtyLabel.text!]!, for: .normal)

    }
    
}
