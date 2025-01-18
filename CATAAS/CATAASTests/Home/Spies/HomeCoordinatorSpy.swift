//
//  HomeCoordinatorSpy.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

@testable import CATAAS

final class HomeCoordinatorSpy: HomeCoordinatorProtocol {
    
    private(set) var goToDetailsCalled = false
    
    var goToDetailsHandler: ((String) -> Void)?
    
    func goToDetails(with identifier: String) {
        goToDetailsCalled = true
        goToDetailsHandler?(identifier)
    }
}
