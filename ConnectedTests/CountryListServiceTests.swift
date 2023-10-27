//
//  CountryListServiceTests.swift
//  ConnectedTests
//
//  Created by Nicolò Curioni on 27/10/23.
//  Copyright © 2023 Nicolò Curioni. All rights reserved.
//

import XCTest
import Combine
@testable import Connected

final class CountryListServiceTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []
    
    func test_fetchCountries() {
        // Given
        let countryViewModel = CountryViewModel()
        let expectation = expectation(description: "Wait to fetch data")
        
        // When
        countryViewModel.fetchCountries()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    XCTFail("Error during fetch countries fetch: \(error)")
                }
                expectation.fulfill()
                
            } receiveValue: { data in
                XCTAssertNotNil(data)
            }
            .store(in: &cancellables)
        
        // Then
        wait(for: [expectation], timeout: 2.0)
    }
}
