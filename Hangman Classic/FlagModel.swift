//
//  FlagModel.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 26.04.2023.
//

enum Continent: String {
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
    let continent: Continent
    let countries: [String: String]

//    let caribbeanCounties: [String: String]
//    let oceaniaCounties: [String: String]
//    let northAmericaCounties: [String: String]
//    let centralAmericaCounties: [String: String]
//    let southAmericaCountires: [String: String]
//
    //    var allCountries: [String: String]
    
}

struct Countries {
    let countries: [String: String]
}

extension FlagModel {
    static func getFlagsAndCountires() -> [FlagModel] {
        let data = FlagDataStore.shared
        
        return [
            FlagModel(continent: .asia, countries: data.asia),
            FlagModel(continent: .africa, countries: data.africa),
            FlagModel(continent: .nearEast, countries: data.nearEast),
            FlagModel(continent: .europe, countries: data.europe)
        ]
    }
}
