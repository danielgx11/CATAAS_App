//
//  HomeUseCaseResponse+Extension.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

@testable import CATAAS

extension HomeUseCaseResponse {
    
    static func stub() -> HomeUseCaseResponse {
        HomeUseCaseResponse(
            data: [.init(
                identifier: "identifier",
                tags: ["cat"],
                createdAt: "Wed Sep 28 2022 02:36:22 GMT+0000 (Coordinated Universal Time)"
            )]
        )
    }
}
