//
//  DetailUseCaseSpy.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 21/01/25.
//

import Foundation
@testable import CATAAS

final class DetailUseCaseSpy: DetailUseCaseProtocol {
    
    var shouldThrowError = false
    
    private(set) var fetchImageCalled = false
    
    func fetchImage(with id: String) async throws -> Data {
        fetchImageCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return Data.init()
    }
    
}
