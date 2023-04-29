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
        animation(sender, fitstAlpha: 0.5, lastAlpha: 1)
        sender.tag == currentButton.tag ? correctDone() : mistakeDone()
        refreshTask()
    }
    
    // MARK: - Private Methods
    private func refreshTask() {
        let dict = countryFlag.countries
   
        buttons.forEach { button in
            let countryIndex = dict.values.randomElement()?.lowercased() //--
            button.configuration?.background.image = UIImage(
                named: countryIndex ?? ""
            )
        }
        
        countLabel.text = "\(score)"
        counrtyLabel.text = countryFlag.countries.keys.randomElement()
        currentButton = buttons.randomElement() ?? UIButton()
        currentButton.configuration?.background.image = UIImage(
            named: (dict[counrtyLabel.text ?? ""] ?? "").lowercased()
        )
    }
    
    private func mistakeDone() {
        mistakesCount += 1
        
        liveImages.forEach { liveImage in
            if liveImage.tag == lives {
                animation(liveImage, fitstAlpha: 0.15, lastAlpha: 0.2)
            }
        }
        
        lives -= 1
        lives = max(lives, 0)
        
        progress = 0
        progressView.setProgress(progress, animated: true)
        
        if lives == 0 {
            gameOver()
        } else if lives == 1 {
            showOkAlert(title: "Осталась одна жизнь!", message: "")
        }
    }
    
    private func correctDone() {
        score += 1
        
        switch lives {
        case ..<5:
            progress += 0.2
            progressView.setProgress(progress, animated: true)
            
            if progress == 1 {
                progressFulled()
            }
        default:
            lives = 5
        }
    }
    
    private func progressFulled() {
        lives += 1
        lives = min(lives, 5)
        
        liveImages.forEach { liveImage in
            if liveImage.tag == lives {
                animation(liveImage, fitstAlpha: 0.2, lastAlpha: 1)
            }
        }
        
        if lives < 5 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                self.progress = 0
                progressView.setProgress(progress, animated: true)
                return
            }
        }
    }
    
    private func gameOver() {
        let messageText = """
                          Очков заработано: \(score)
                          Количество ошибок: \(mistakesCount)
                          """
        
        showOkAlert(title: "Жизни закончились", message: messageText) { _ in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func animation(_ sender: UIView, duration: Double = 0.05, fitstAlpha: CGFloat, lastAlpha: CGFloat) {
        UIView.animate(withDuration: duration, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            sender.alpha = fitstAlpha
        }, completion: { _ in
            UIView.animate(withDuration: duration, animations: {
                sender.transform = .identity
                sender.alpha = lastAlpha
            })
        })
    }
}
