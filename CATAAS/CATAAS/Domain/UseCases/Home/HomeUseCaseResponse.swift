//
//  HomeUseCaseResponse.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import Foundation

struct HomeUseCaseResponse: Codable {
    
    let data: [HomeDataResponse]
    
    enum CodingKeys: String, CodingKey {
        case data = "items"
    }
    
    struct HomeDataResponse: Codable {
        
        let identifier: String
        let tags: [String]
        let owner: String?
        let createdAt: String
        let updatedAt: String?
        
        init(identifier: String, tags: [String], owner: String? = nil, createdAt: String, updatedAt: String? = nil) {
            self.identifier = identifier
            self.tags = tags
            self.owner = owner
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }
        
        enum CodingKeys: String, CodingKey {
            case tags, owner, createdAt, updatedAt
            case identifier = "_id"
        }
        
        // MARK: DECODE
        
        init(from decoder: any Decoder) throws {
            let container: KeyedDecodingContainer<HomeUseCaseResponse.HomeDataResponse.CodingKeys> = try decoder.container(keyedBy: HomeUseCaseResponse.HomeDataResponse.CodingKeys.self)
            
            let rawCreatedAtDate = try container.decode(String.self, forKey: .createdAt)
            let rawUpdatedAtDate = try container.decodeIfPresent(String.self, forKey: .updatedAt)
            
            self.tags = try container.decode([String].self, forKey: .tags)
            self.owner = try container.decodeIfPresent(String.self, forKey: .owner)
            self.identifier = try container.decode(String.self, forKey: .identifier)
            
            if let createdAtDate = rawCreatedAtDate.formattedDate(inputFormat: .coordinatedUniversalTime, outputFormat: .enUSName),
               let updatedAtDate = rawUpdatedAtDate?.formattedDate(inputFormat: .coordinatedUniversalTime, outputFormat: .enUSName) {
                self.createdAt = createdAtDate
                self.updatedAt = updatedAtDate
            } else {
                throw DecodingError.dataCorruptedError(forKey: .createdAt, in: container, debugDescription: "Invalid date format")
            }
        }
    }
}

//"_id":"rV1MVEh0Af2Bm4O0",
//"tags": [
//    "kitten",
//    "several",
//    "gif"
//],
//"owner":"null",
//"createdAt":"Sun May 01 2022 20:57:11 GMT+0000 (Coordinated Universal Time)",
//"updatedAt":"Tue Oct 11 2022 07:52:32 GMT+0000 (Coordinated Universal Time)"
