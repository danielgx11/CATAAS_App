//
//  ServiceError.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import Foundation

enum ServiceError: Error {
    case unknown
    case invalidUrl
    case invalidStatusCode
    case dataTypeMismatch
    
    var localizedDescription: String {
        switch self {
        case .unknown:
            return "Unknown error"
        case .invalidUrl:
            return "Invalid URL, try again!"
        case .invalidStatusCode:
            return "Invalid status code"
        case .dataTypeMismatch:
            return "Type Mismatch error"
        }
    }
}
