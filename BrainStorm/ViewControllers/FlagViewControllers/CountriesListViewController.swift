//
//  CountriesListViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 26.04.2023.
//

import UIKit

final class CountriesListViewController: UITableViewController {
    
    // MARK: - Public Properties
    var countries: [CountryFlag]!
    
    // MARK: - Private Properties
    private var separatedCountries: [CountryFlag] {
        var countries = countries
        countries?.removeFirst()
        
        return countries ?? []
    }

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = view.frame.height / 10
    }
    
    // MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        separatedCountries.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        separatedCountries[section].countries.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        separatedCountries[section].place.rawValue
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
        
        let continensAndFlags = separatedCountries[indexPath.section].countries
        let country = Array(continensAndFlags.keys).sorted()[indexPath.row]
        let flagImageName = continensAndFlags[country]?.lowercased() ?? ""
        
        var content = cell.defaultContentConfiguration()

        content.imageProperties.maximumSize.width = tableView.rowHeight * 0.6
        content.imageProperties.cornerRadius = tableView.rowHeight / 20
        content.textProperties.font = .systemFont(ofSize: 17, weight: .light)
        content.imageToTextPadding = 20

        content.text = country
        content.image = UIImage(named: flagImageName)
        
        cell.contentConfiguration = content
        
        return cell
    }
}
