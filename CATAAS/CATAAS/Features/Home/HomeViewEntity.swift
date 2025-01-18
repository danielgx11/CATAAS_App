//
//  HomeViewEntity.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import Foundation

struct HomeViewEntity {
    
    let identifier: String
    let tags: [String]
    let owner: String?
    let formattedCreatedAtDate: String
}

#if DEBUG

extension HomeViewEntity {
    
    static func stub() -> [HomeViewEntity] {
        [
            HomeViewEntity(
                identifier: "rV1MVEh0Af2Bm4O0",
                tags: ["kitten", "several", "gif"],
                owner: nil,
                formattedCreatedAtDate: "10/10/2010"
            )
        ]
    }
}

#endif
