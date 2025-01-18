//
//  ServiceManager.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import Foundation

protocol ServiceManagerProtocol {
    func fetch<T: Decodable>(request: ServiceRequest, type: T.Type) async throws -> T
}

final class ServiceManager: ServiceManagerProtocol {
    
    func fetch<T>(request: ServiceRequest, type: T.Type) async throws -> T where T : Decodable {
        guard let baseUrl = URL(string: request.baseUrl)else {
            throw ServiceError.invalidUrl
        }
        
        let url = baseUrl.appending(path: request.path) 
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw ServiceError.invalidStatusCode
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }
}
