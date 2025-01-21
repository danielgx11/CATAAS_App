//
//  HomeViewModel.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import Foundation

@MainActor
@Observable
final class HomeViewModel {
    
    // MARK: - METRICS
    
    fileprivate enum ViewModelMetrics {
        static let delay: UInt64 = 1_000_000_000
    }
    
    // MARK: - PROPERTIES
    
    private let useCase: HomeUseCaseProtocol
    private var viewEntity: HomeViewEntity?
    private(set) var viewState: HomeViewState = .isLoading(true)
    private let factory: HomeViewFactoryProtocol
    private let coordinator: HomeCoordinatorProtocol
    
    // MARK: - INITIALIZERS
    
    init(useCase: HomeUseCaseProtocol, factory: HomeViewFactoryProtocol, coordinator: HomeCoordinatorProtocol) {
        self.useCase = useCase
        self.factory = factory
        self.coordinator = coordinator
        print("HomeViewModel initialized with coordinator: \(coordinator)")
    }
}

// MARK: - METHODS

extension HomeViewModel {
    
    func fetchItems() {
        viewState = .isLoading(true)
        
        Task {
            try await Task.sleep(nanoseconds: ViewModelMetrics.delay)
            
            do {
                let response = try await useCase.fetchItems()
                let entity = factory.buildHomeViewEntity(response: response)
                viewState = .hasData(entity)
            } catch {
                debugPrint(error.localizedDescription)
                // TODO: handle errors
            }
        }
    }
    
    func goToDetails(with identifier: String) {
        coordinator.goToDetails(with: identifier)
    }
}
