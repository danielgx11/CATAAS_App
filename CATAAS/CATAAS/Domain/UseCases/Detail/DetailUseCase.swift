//
//  DetailUseCase.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import Foundation

protocol DetailUseCaseProtocol {
    func fetchImage(with id: String) async throws -> Data
}

final class DetailUseCase {
    
    let service: ServiceManagerProtocol
    
    init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension DetailUseCase: DetailUseCaseProtocol {
    
    func fetchImage(with id: String) async throws -> Data {
        try await service.fetch(request: .getImage(id: id), type: Data.self)
    }
}
