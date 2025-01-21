//
//  DetailViewState.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

enum DetailViewState {
    case hasData(DetailViewEntity)
    case hasError(message: String)
    case isLoading(Bool)
}
