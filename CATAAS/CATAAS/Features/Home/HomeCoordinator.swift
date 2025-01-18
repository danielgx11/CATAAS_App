//
//  HomeCoordinator.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import UIKit
import SwiftUI

protocol HomeCoordinatorProtocol {
    
    func goToDetails(with identifier: String)
}

class HomeCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    
    var navigationController: UINavigationController
    var factory: HomeFactoryViewControllerProtocol
    
    // MARK: - INITIALIZERS
    
    init(factory: HomeFactoryViewControllerProtocol, navigationController: UINavigationController) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    // MARK: - METHODS
    
    func start() {
        let viewController = factory.makeHostingHomeView(navigationController: navigationController)
        navigationController.pushViewController(viewController, animated: true)
    }

}

// MARK: - HomeCoordinatorProtocol

extension HomeCoordinator: HomeCoordinatorProtocol {
    
    func goToDetails(with identifier: String) {
        // TODO: go to details
    }
}
