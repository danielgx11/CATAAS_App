//
//  DetailViewEntity.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import Foundation

struct DetailViewEntity {
    
    let imageData: Data
    let imageUrl: URL?
}

#if DEBUG

extension DetailViewEntity {
    
    static func stub() -> DetailViewEntity {
        DetailViewEntity(imageData: .init(), imageUrl: URL(string: "https://cataas.com/cat/Rn6xqsiHb9B7qgLw"))
    }
}

#endif
