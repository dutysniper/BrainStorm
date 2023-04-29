//
//  CountryFlag.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 26.04.2023.
//

enum Place: String {
    case asia = "Азия"
    case africa = "Африка"
    case nearEast = "Ближний Восток"
    case europe = "Европа"
    case caribbean = "Карибский Бассейн"
    case oceania = "Океания"
    case northAmerica = "Северная Америка"
    case centralAmerica = "Центральная Америка"
    case southAmerica = "Южная Америка"
    case allCountries = "Весь мир"
}

struct CountryFlag {
    let place: Place
    let countries: [String: String]
}

extension CountryFlag {
    static func getCountires() -> [CountryFlag] {
        let data = FlagDataStore.shared
        var allCountries = ["": ""]
        
        var coutryFlags = [
            CountryFlag(place: .asia, countries: data.asia),
            CountryFlag(place: .africa, countries: data.africa),
            CountryFlag(place: .nearEast, countries: data.nearEast),
            CountryFlag(place: .europe, countries: data.europe),
            CountryFlag(place: .caribbean, countries: data.caribbean),
            CountryFlag(place: .oceania, countries: data.oceania),
            CountryFlag(place: .northAmerica, countries: data.northAmerica),
            CountryFlag(place: .centralAmerica, countries: data.centralAmerica),
            CountryFlag(place: .southAmerica, countries: data.southAmerica)
        ]
        
        for countryFlag in coutryFlags {
            allCountries.merge(countryFlag.countries, uniquingKeysWith: { $1 })
        }
        
        allCountries.removeValue(forKey: "")
        coutryFlags.insert(
            CountryFlag(place: .allCountries, countries: allCountries),
            at: 0
        )
        
        return coutryFlags
    }
}
