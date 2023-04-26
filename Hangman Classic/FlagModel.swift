//
//  FlagModel.swift
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

struct FlagModel {
    let place: Place
    let countries: [String: String]
}

extension FlagModel {
    static func getCountires() -> [FlagModel] {
        let data = FlagDataStore.shared
        
        return [
            FlagModel(place: .asia, countries: data.asia),
            FlagModel(place: .africa, countries: data.africa),
            FlagModel(place: .nearEast, countries: data.nearEast),
            FlagModel(place: .europe, countries: data.europe),
            FlagModel(place: .caribbean, countries: data.caribbean),
            FlagModel(place: .oceania, countries: data.oceania),
            FlagModel(place: .northAmerica, countries: data.northAmerica),
            FlagModel(place: .centralAmerica, countries: data.centralAmerica),
            FlagModel(place: .southAmerica, countries: data.southAmerica)
        ]
    }
}

//allCountries.merge(countries.countries, uniquingKeysWith: { $1 })
