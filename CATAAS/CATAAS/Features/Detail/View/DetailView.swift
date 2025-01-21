//
//  DetailView.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 18/01/25.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - METRICS

    fileprivate enum Constants {
        static let navigationTitle = "Cat Detail"
    }
    
    // MARK: - PROPERTIES
    
    @Bindable private var viewModel: DetailViewModel
    
    // MARK: - INITIALIZERS
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case let .hasData(entity):
                contentView(with: entity)
            case .hasError:
                errorView()
            case let .isLoading(status):
                loadingView(isLoading: status)
                    .accessibilityIdentifier("loading_view")
            }
        }
        .navigationTitle(Constants.navigationTitle)
        .onAppear {
            viewModel.initState()
        }
    }
    
    private func contentView(with entity: DetailViewEntity) -> some View {
        VStack {
            catImage(with: entity)
        }
    }
    
    @ViewBuilder
    private func catImage(with entity: DetailViewEntity) -> some View {
        if let uiImage = UIImage(data: entity.imageData) {
            Image(uiImage: uiImage)
                .accessibilityIdentifier("cat_image_identifier")
        } else {
            catAsyncImage(with: entity.imageUrl)
        }
    }
    
    private func catAsyncImage(with url: URL?) -> some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                loadingView(isLoading: true)
            case let .success(image):
                image
                    .resizable()
                    .scaledToFit()
            default:
                Image("error-icon")
                    .resizable()
                    .scaledToFit()
            }
        }
        .accessibilityIdentifier("cat_image_identifier_async")
    }

    
    private func errorView() -> some View {
        EmptyView()
    }
    
    @ViewBuilder
    private func loadingView(isLoading: Bool) -> some View {
        if isLoading {
            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}

#Preview {
    let service = ServiceManager()
    let useCase = DetailUseCase(service: service)
    let factory = DetailViewFactory()
    let coordinatorFactory = DetailFactoryViewController()
    let coordinator = DetailCoordinator(factory: coordinatorFactory, navigationController: UINavigationController())
    let viewModel = DetailViewModel(useCase: useCase,
                                    factory: factory,
                                    coordinator: coordinator,
                                    identifier: "Rn6xqsiHb9B7qgLw")
    DetailView(viewModel: viewModel)
}
