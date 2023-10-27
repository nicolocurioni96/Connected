//
//  CountryViewModel.swift
//  Connected
//
//  Created by Nicolò Curioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import Foundation
import Combine

class CountryViewModel {
    @Published var countries: [Country] = []
    @Published var error: Error?
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        fetchCountries()
    }
    
    func fetchCountries() {
        guard let url = URL(string: "https://restcountries.com/v3/all") else { return }

            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: [Country].self, decoder: JSONDecoder())
                .replaceError(with: [])
                .receive(on: DispatchQueue.main)
                .sink { [weak self] countries in
                    self?.countries = countries
                    
                    print("⚠️ Countries: \(countries)")
                }
                .store(in: &cancellables)
    }
}

enum CountryAPIError: Error {
    case invalidResponse
    case decodingError
}
