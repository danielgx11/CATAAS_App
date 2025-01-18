//
//  HomeUseCase.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

protocol HomeUseCaseProtocol {
    func fetchItems() async throws -> HomeUseCaseResponse
}

final class HomeUseCase {
    
    let service: ServiceManagerProtocol
    
    init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension HomeUseCase: HomeUseCaseProtocol {
    
    func fetchItems() async throws -> HomeUseCaseResponse {
        guard let mockFallback = fallbackHome else {
            throw MessageError.fallbackError
        }
        
        return mockFallback
    }
    
    var fallbackHome: HomeUseCaseResponse? {
        MockFallback.fallbackJSON(type: .homeIds)
    }
}
