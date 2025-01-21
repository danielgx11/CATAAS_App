//
//  HomeViewFactorySpy.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

@testable import CATAAS

final class HomeViewFactorySpy: HomeViewFactoryProtocol {

    private(set) var buildEntityCalled = false
    
    func buildHomeViewEntity(response: HomeUseCaseResponse) -> [HomeViewEntity] {
        buildEntityCalled = true
        
        return HomeViewEntity.stub()
    }
    
}
