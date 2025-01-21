//
//  AppCoordinator.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    
    weak var coordinatorDelegate: CoordinatorDelegate?
    
    var navigationController: UINavigationController
    let factory: AppCoordinatorFactoryProtocol
    let window: UIWindow?
    
    deinit { print("AppCoordinator deallocated") }
        
    // MARK: - INITIALIZERS
    
    init(factory: AppCoordinatorFactoryProtocol, navigationController: UINavigationController, window: UIWindow?) {
        self.factory = factory
        self.navigationController = navigationController
        self.window = window
    }
    
    // MARK: - METHODS
    
    func start() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        showHome()
    }
    
    private func showHome() {
        let homeCoordinator = factory.makeHomeCoordinator(navigationController: navigationController)
        DispatchQueue.main.async {
            homeCoordinator.delegate = self
            homeCoordinator.start()
        }
    }
}

// MARK: - HomeCoordinatorDelegate

extension AppCoordinator: HomeCoordinatorDelegate {
    
    func goToDetails(with identifier: String) {
        let detailCoordinator = factory.makeDetailCoordinator(navigationController: navigationController)
        detailCoordinator.goToDetails(with: identifier)
    }
}
