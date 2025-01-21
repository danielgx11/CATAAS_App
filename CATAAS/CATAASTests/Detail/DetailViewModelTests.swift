//
//  DetailViewModelTests.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 21/01/25.
//

import Testing

@testable import CATAAS

@Suite(.tags(.detail)) struct DetailViewModelTests {
    
    // MARK: - PROPERTIES
    
    var useCaseSpy = DetailUseCaseSpy()
    var factorySpy = DetailViewFactorySpy()
    var coordinatorSpy = DetailCoordinatorSpy()
    
    @MainActor var sut: DetailViewModel!
    
    // MARK: - INITIALIZERS
    
    init() async throws {
        sut = await DetailViewModel(
            useCase: useCaseSpy,
            factory: factorySpy,
            coordinator: coordinatorSpy,
            identifier: ""
        )
    }
    
}

// MARK: - TESTS

extension DetailViewModelTests {
    
    @Test("Fetching image with cat id success/failure", arguments: [true, false])
    func fetchImage(shouldShowError: Bool) async {
        useCaseSpy.shouldThrowError = shouldShowError
        
        await sut.initState()
        
        do {
            let itemData = try await useCaseSpy.fetchImage(with: "")
            
            #expect(useCaseSpy.fetchImageCalled)
            #expect(!shouldShowError, "Error was not expect to occur")
            #expect(itemData != nil)
        } catch {
            #expect(useCaseSpy.fetchImageCalled)
            #expect(shouldShowError, "Error should occur")
            #expect(error as? MessageError == MessageError.default)
        }
    }
}
