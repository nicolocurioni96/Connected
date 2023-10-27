//
//  API+Extensions.swift
//  Connected
//
//  Created by Nicolò Curioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import Foundation

enum CountryDataAPIError: Swift.Error, LocalizedError {
    case invalidURL(URLError)
    case responseError(Int)
    case decodingError(DecodingError)
    case imageDeserialization
    
    var errorDescription: String? {
        switch self {
        case let .invalidURL(error):
            return "Invalid URL: \(error.localizedDescription)"
        case let .responseError(error):
            return "Bad response code: \(error)"
        case let .decodingError(error):
            return "Cannot decode data, with error: \(error)"
        case .imageDeserialization:
            return "Cannot deserialize image from data"
        }
    }
}
