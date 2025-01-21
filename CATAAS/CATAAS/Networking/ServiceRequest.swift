//
//  ServiceRequest.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

enum ServiceRequest {
    
    case getImage(id: String)
    case getItems
    
    var baseUrl: String {
        switch self {
        case .getItems:
            return ""
        case .getImage:
            return "https://cataas.com"
        }
    }
    
    var path: String {
        switch self {
        case .getItems:
            return ""
        case let .getImage(id):
            return "/cat/\(id)"
        }
    }
    
    var method: String {
        switch self {
        case .getItems, .getImage:
            return "GET"
        }
    }
}
