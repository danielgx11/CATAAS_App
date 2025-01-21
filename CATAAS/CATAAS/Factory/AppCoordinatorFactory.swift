//
//  AppCoordinatorFactory.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import UIKit

protocol AppCoordinatorFactoryProtocol {
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator
    func makeDetailCoordinator(navigationController: UINavigationController) -> DetailCoordinator
}

struct AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    
    func makeHomeCoordinator(navigationController: UINavigationController) -> HomeCoordinator {
        let factory = HomeFactoryViewController()
        let coordinator = HomeCoordinator(factory: factory, navigationController: navigationController)
        return coordinator
    }
    
    func makeDetailCoordinator(navigationController: UINavigationController) -> DetailCoordinator {
        let factory = DetailFactoryViewController()
        return DetailCoordinator(factory: factory, navigationController: navigationController)
    }
}
