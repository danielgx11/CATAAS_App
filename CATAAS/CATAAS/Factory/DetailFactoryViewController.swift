//
//  DetailFactoryViewController.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 20/01/25.
//

import SwiftUI

protocol DetailFactoryViewControllerProtocol {
    func makeHostingDetailView(navigationController: UINavigationController, catIdentifier: String) -> UIHostingController<DetailView>
}

struct DetailFactoryViewController: @preconcurrency DetailFactoryViewControllerProtocol {
    
    @MainActor
    func makeHostingDetailView(navigationController: UINavigationController, catIdentifier: String) -> UIHostingController<DetailView> {
        let service = ServiceManager()
        let useCase = DetailUseCase(service: service)
        let factory = DetailViewFactory()
        let coordinatorFactory = DetailFactoryViewController()
        let coordinator = DetailCoordinator(factory: coordinatorFactory, navigationController: navigationController)
        let viewModel = DetailViewModel(useCase: useCase, factory: factory, coordinator: coordinator, identifier: catIdentifier)
        return UIHostingController(rootView: DetailView(viewModel: viewModel))
    }
}
