//
//  DetailCoordinator.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 20/01/25.
//

import SwiftUI

protocol DetailCoordinatorProtocol { }

class DetailCoordinator: Coordinator {
    
    // MARK: - PROPERTIES
    
    var navigationController: UINavigationController
    var factory: DetailFactoryViewControllerProtocol
    
    // MARK: - INITIALIZERS
    
    init(
        factory: DetailFactoryViewControllerProtocol,
        navigationController: UINavigationController
    ) {
        self.factory = factory
        self.navigationController = navigationController
    }
    
    // MARK: - METHODS
    
    func goToDetails(with catIdentifier: String) {
        let viewController = factory.makeHostingDetailView(
            navigationController: navigationController,
            catIdentifier: catIdentifier
        )
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - DetailCoordinatorProtocol

extension DetailCoordinator: DetailCoordinatorProtocol { }
