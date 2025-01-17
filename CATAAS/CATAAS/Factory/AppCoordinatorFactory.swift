//
//  AppCoordinatorFactory.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import UIKit

protocol AppCoordinatorFactoryProtocol {
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator
}

struct AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        let factory = HomeFactoryViewController()
        return HomeCoordinator(factory: factory, navigationController: navigationController)
    }
}
