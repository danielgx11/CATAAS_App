//
//  HomeUseCaseSpy.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import Foundation

@testable import CATAAS

final class HomeUseCaseSpy: HomeUseCaseProtocol {
    
    var shouldThrowError = false
    
    private(set) var fetchItemsCalled = false
    
    func fetchItems() async throws -> HomeUseCaseResponse {
        fetchItemsCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return HomeUseCaseResponse.stub()
    }
    
}
