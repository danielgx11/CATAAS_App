//
//  HomeViewModelTests.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import Testing

@testable import CATAAS

@Suite(.tags(.home)) struct HomeViewModelTests {
    
    // MARK: - PROPERTIES
    
    var useCaseSpy = HomeUseCaseSpy()
    var factorySpy = HomeViewFactorySpy()
    var coordinatorSpy = HomeCoordinatorSpy()
    
    @MainActor var sut: HomeViewModel!
    
    // MARK: - INITIALIZERS
    
    init() async throws {
        sut = await HomeViewModel(useCase: useCaseSpy, factory: factorySpy, coordinator: coordinatorSpy)
    }
    
}

// MARK: - TESTS

extension HomeViewModelTests {
    
    @Test("Fetching items with cat ids success/failure", arguments: [true, false])
    func fetchItems(shouldShowError: Bool) async {
        useCaseSpy.shouldThrowError = shouldShowError
        
        await sut.fetchItems()
        
        do {
            let items = try await useCaseSpy.fetchItems()
            
            #expect(useCaseSpy.fetchItemsCalled)
            #expect(!shouldShowError, "Error was not expect to occur")
            #expect(items.data.count == HomeUseCaseResponse.stub().data.count)
            #expect(items.data.first?.identifier == HomeUseCaseResponse.stub().data.first?.identifier)
        } catch {
            #expect(useCaseSpy.fetchItemsCalled)
            #expect(shouldShowError, "Error should occur")
            #expect(error as? MessageError == MessageError.default)
        }
    }
    
    @Test("Test if go to details is being called", arguments: ["expected_id", "different_id"])
    func goToDetailsCalled(identifier: String) async throws {
        coordinatorSpy.goToDetailsHandler = {
            #expect($0 == identifier)
        }
        
        await sut.goToDetails(with: identifier)
        
        #expect(coordinatorSpy.goToDetailsCalled)
    }
}
