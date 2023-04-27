//
//  FlagSettingsViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 27.04.2023.
//

import UIKit

final class FlagSettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var countryPicker: UIPickerView!
    @IBOutlet private var countriesQuantity: UILabel!
    @IBOutlet private var NameLabel: UILabel!
    
    // MARK: - Public Properties
    var gameDescription: GameDescription!
    
    // MARK: - Private Properties
    private let countries = CountryFlag.getCountires()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        NameLabel.text = gameDescription.game.rawValue
        
        let index = countryPicker.selectedRow(inComponent: .zero)
        let countCountries = countries[index].countries.count
        countriesQuantity.text = "Количество стран: \(countCountries)"
        
        countryPicker.delegate = self
        countryPicker.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let flagGameVC = segue.destination as? FlagGameViewController else { return }
        
        let index = countryPicker.selectedRow(inComponent: .zero)
        flagGameVC.countryFlag = countries[index]
    }
    
}

// MARK: - UIPickerViewDelegate
extension FlagSettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        countries[row].place.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let index = countryPicker.selectedRow(inComponent: .zero)
        let countCountries = countries[index].countries.count
        countriesQuantity.text = "Количество стран: \(countCountries)"
    }
}
