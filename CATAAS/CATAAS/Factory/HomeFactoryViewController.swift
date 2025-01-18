//
//  HomeFactoryViewController.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import SwiftUI

protocol HomeFactoryViewControllerProtocol {
    func makeHostingHomeView(navigationController: UINavigationController) -> UIHostingController<HomeView>
}

struct HomeFactoryViewController: @preconcurrency HomeFactoryViewControllerProtocol {
    
    @MainActor
    func makeHostingHomeView(navigationController: UINavigationController) -> UIHostingController<HomeView> {
        let service = ServiceManager()
        let useCase = HomeUseCase(service: service)
        let factory = HomeViewFactory()
        let coordinatorFactory = HomeFactoryViewController()
        let coordinator = HomeCoordinator(factory: coordinatorFactory, navigationController: navigationController)
        let viewModel = HomeViewModel(useCase: useCase, factory: factory, coordinator: coordinator)
        return UIHostingController(rootView: HomeView(viewModel: viewModel))
    }
}
