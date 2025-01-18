//
//  HomeViewState.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

enum HomeViewState {
    case hasData([HomeViewEntity])
    case hasError
    case isLoading(Bool)
}
