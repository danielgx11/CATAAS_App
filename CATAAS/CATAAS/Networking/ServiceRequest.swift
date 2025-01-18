//
//  ServiceRequest.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

enum ServiceRequest {
    
    case getItems
    
    var baseUrl: String {
        switch self {
        case .getItems:
            return ""
        }
    }
    
    var path: String {
        switch self {
        case .getItems:
            return ""
        }
    }
    
    var method: String {
        switch self {
        case .getItems:
            return "GET"
        }
    }
}
