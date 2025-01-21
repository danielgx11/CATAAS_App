//
//  ViewFactoryProtocol.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 21/01/25.
//

protocol ViewFactoryProtocol {
    func buildErrorMessage(with error: Error) -> String
}

extension ViewFactoryProtocol {
    
    func buildErrorMessage(with error: Error) -> String {
        if let serviceError = error as? ServiceError {
            return "Service Error: \(error.localizedDescription)"
        }
        
        return "Unknown Error: \(error.localizedDescription)"
    }
}
