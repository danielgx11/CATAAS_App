//
//  HomeFactoryViewController.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import SwiftUI

protocol HomeFactoryViewControllerProtocol {
    func makeHostingHomeView() -> UIHostingController<HomeView>
}

struct HomeFactoryViewController: HomeFactoryViewControllerProtocol {
    
    func makeHostingHomeView() -> UIHostingController<HomeView> {
        UIHostingController(rootView: HomeView())
    }
}
