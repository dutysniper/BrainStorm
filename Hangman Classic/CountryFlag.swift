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
}

struct CountryFlag {
    let place: Place
    let countries: [String: String]
}

extension CountryFlag {
    static func getCountires() -> [CountryFlag] {
        let data = FlagDataStore.shared
        
        return [
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
    }
}

//allCountries.merge(countries.countries, uniquingKeysWith: { $1 })
