//
//  FlagGameViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 25.04.2023.
//

import UIKit

final class FlagGameViewController: UIViewController {
     
    // MARK: - IB Outlets
    @IBOutlet private var counrtyLabel: UILabel!
    @IBOutlet private var countLabel: UILabel!
    @IBOutlet private var continentLabel: UILabel!
    
    @IBOutlet private var buttons: [UIButton]!
    @IBOutlet private var liveImages: [UIImageView]!
    
    @IBOutlet private var circleView: UIView!
    @IBOutlet private var progressView: UIProgressView!
    
    // MARK: - Public Properties
    var countryFlag: CountryFlag!
    
    // MARK: - Private Properties
    private var currentButton = UIButton()
    private var progress: Float = 1
    
    private var score = 0
    private var lives = 5
    private var mistakesCount = 0
    
    // MARK: - Override Methods
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
    
    // MARK: - IB Actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.tag == currentButton.tag ? correctDone() : mistakeDone()
        refreshTask()
    }
    
    // MARK: - Private Methods
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
    
    
    private func setupButtons() {
        buttons.forEach { button in
            let countryIndex = countryFlag.countries.values.randomElement()!.lowercased()
            button.configuration?.background.image = UIImage(named: countryIndex)

            button.setTitle(countryIndex, for: .normal)
        }
    }
    
    
    
    
    private func mistakeDone() {
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
    }
    
    
    
    private func correctDone() {
        score += 1
        
        switch lives {
        case ..<5:
            
            progress += 0.2
            progressView.setProgress(progress, animated: true)
            
            if progress == 1 {
                lives += 1
                progressFulled()
            }
            
            

        default:
            lives = 5
        }
    }
    
    
    
    
    
    private func progressFulled() {
        
        
        liveImages.forEach { liveImage in
            if liveImage.tag == lives {
                liveImage.alpha = 1
            }
        }
        lives = min(lives, 5)
        
        if lives < 5 {
       
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                self.progress = 0
                progressView.setProgress(progress, animated: true)
                return
            }
        }
    }
    
    
    
    
    
}
