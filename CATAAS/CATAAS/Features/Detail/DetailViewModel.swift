//
//  DetailViewModel.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import Foundation

@MainActor
@Observable
final class DetailViewModel {
    
    // MARK: - METRICS
    
    fileprivate enum ViewModelMetrics {
        static let delay: UInt64 = 1_000_000_000
    }
    
    // MARK: - PROPERTIES
    
    private let useCase: DetailUseCaseProtocol
    private var viewEntity: DetailViewEntity?
    private(set) var viewState: DetailViewState = .isLoading(true)
    private let factory: DetailViewFactoryProtocol
    private let catIdentifier: String
    private let coordinator: DetailCoordinatorProtocol
    
    // MARK: - INITIALIZERS
    
    init(
        useCase: DetailUseCaseProtocol,
        factory: DetailViewFactoryProtocol,
        coordinator: DetailCoordinatorProtocol,
        identifier: String
    ) {
        self.useCase = useCase
        self.factory = factory
        self.coordinator = coordinator
        self.catIdentifier = identifier
    }
}

// MARK: - METHODS

extension DetailViewModel {
    
    func initState() {
        viewState = .isLoading(true)

        Task {
            try await Task.sleep(nanoseconds: ViewModelMetrics.delay)

            do {
                let response = try await useCase.fetchImage(with: catIdentifier)
                let entity = factory.buildDetailViewEntity(imageData: response, catIdentifier: catIdentifier)
                viewState = .hasData(entity)
            } catch {
                debugPrint(error.localizedDescription)
                // TODO: handle errors
            }
        }
    }
}
