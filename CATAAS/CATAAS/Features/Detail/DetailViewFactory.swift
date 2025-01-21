//
//  DetailViewFactory.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import Foundation

protocol DetailViewFactoryProtocol {
    func buildDetailViewEntity(imageData: Data, catIdentifier: String) -> DetailViewEntity
}

struct DetailViewFactory: DetailViewFactoryProtocol {
    func buildDetailViewEntity(imageData: Data, catIdentifier: String) -> DetailViewEntity {
        let imageUrl = URL(string: "https://cataas.com/cat/\(catIdentifier)")
        return DetailViewEntity(imageData: imageData, imageUrl: imageUrl)
    }
}
