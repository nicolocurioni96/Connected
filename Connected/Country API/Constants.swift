//
//  Constants.swift
//  Connected
//
//  Created by Nicolò Curioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import Foundation

enum CountryEndpoint: String {
    case all = "all"
    case name = "name/"
}

enum Constants {
    ///# Main URL data
    static let baseURL = "https://restcountries.com"
    static let apiPath = "/v3.1/"
    
    static func composeEndpoint(_ baseURL: String = Self.baseURL, _ apiPath: String = Self.apiPath, withEndpoint endpoint: CountryEndpoint) -> URL? {
        return URL(string: baseURL + apiPath + endpoint.rawValue)
    }
}
