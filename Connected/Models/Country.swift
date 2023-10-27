//
//  Country.swift
//  Connected
//
//  Created by Nicolò Curioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import Foundation

struct Country: Codable, Equatable {
    typealias Code = String
    
    let name: String
    let translations: [String : String?]
    let population: Int
    let flag: URL?
    let alpha3Code: Code
    
    enum CodingKeys: String, CodingKey {
        case name
        case translations
        case population
        case flag = "alpha2Code"
        case alpha3Code
    }
}

extension Country {
    struct Detail: Codable, Equatable {
        let capital: String
        let currencies: [Currency]
        let neighbors: [Country]
    }
}

extension Country.Detail {
    struct Intermediate: Codable, Equatable {
        let capital: String
        let currencies: [Country.Currency]
        let borders: [String]
    }
}

extension Country {
    struct Currency: Codable, Equatable {
        let code: String
        let symbol: String?
        let name: String
    }
}

// MARK: - Helpers
extension Country: Identifiable {
    var id: String { alpha3Code }
}

extension Country.Currency: Identifiable {
    var id: String { code }
}

extension Country {
    func name(locale: Locale) -> String {
        let localeID = locale.shortIdentifier
        
        if let value = translations[localeID],
           let localizedName = value {
            return localizedName
        }
        
        return name
    }
}
