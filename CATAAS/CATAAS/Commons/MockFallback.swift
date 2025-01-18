//
//  MockFallback.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import Foundation

struct MockFallback {
    
    enum FallbackType: String {
        case homeIds = "Home"
    }
    
    private static func getJSONFallback(type: FallbackType) -> URL? {
        guard let path = Bundle.main.path(forResource: type.rawValue, ofType: "json") else {
            fatalError("File not found")
        }
        
        return URL(filePath: path, directoryHint: .isDirectory)
    }
    
    static func fallbackJSON<T: Decodable>(type: FallbackType) -> T? {
        do {
            guard let mockPath = getJSONFallback(type: type) else {
                return nil
            }
            
            let jsonData = try Data(contentsOf: mockPath, options: .mappedIfSafe)
            let response = try JSONDecoder().decode(T.self, from: jsonData)
            return response
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
}
