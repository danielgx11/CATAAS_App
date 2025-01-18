//
//  HomeViewFactory.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

protocol HomeViewFactoryProtocol {
    func buildHomeViewEntity(response: HomeUseCaseResponse) -> [HomeViewEntity]
}

struct HomeViewFactory: HomeViewFactoryProtocol {
    func buildHomeViewEntity(response: HomeUseCaseResponse) -> [HomeViewEntity] {
        response.data.map {
            HomeViewEntity(identifier: $0.identifier,
                           tags: $0.tags.compactMap{ $0 },
                           owner: $0.owner,
                           formattedCreatedAtDate: $0.createdAt)
        }
    }
}
