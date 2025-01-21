//
//  DetailViewFactorySpy.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 21/01/25.
//

import Foundation

@testable import CATAAS

final class DetailViewFactorySpy: DetailViewFactoryProtocol {
    
    private(set) var buildEntityCalled = false
    
    
    func buildDetailViewEntity(imageData: Data, catIdentifier: String) -> DetailViewEntity {
        buildEntityCalled = true
        
        return DetailViewEntity.stub()
    }
}
