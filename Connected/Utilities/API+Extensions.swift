//
//  API+Extensions.swift
//  Connected
//
//  Created by nicolocurioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import Foundation

typealias HTTPStatusCode = Int
typealias HTTPStatusCodes = Range<HTTPStatusCode>

extension HTTPStatusCodes {
    static let success = 200..<300
}

protocol APICall {
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    
    func body() throws -> Data?
}

enum APIError: Swift.Error {
    case invalidURL
    case httpStatusCode(HTTPStatusCode)
    case unexpectedResponse
    case imageDeserialization
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case let .httpStatusCode(code):
            return "Unexpected HTTP Status Code: \(code)"
        case .unexpectedResponse:
            return "Unexpected response from server"
        case .imageDeserialization:
            return "Cannot deserialize image from data"
        }
    }
}

extension APICall {
    func urlRequest(baseURL: String) throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        
        return request
    }
}
