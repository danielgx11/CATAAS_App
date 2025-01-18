//
//  Untitled.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

enum MessageError: Error {
    case `default`
    case fallbackError
    
    var localizedDescription: String {
        switch self {
        case .default:
            return "Throws the default error message"
        case .fallbackError:
            return "Mock JSON is unavailable"
        }
    }
}
