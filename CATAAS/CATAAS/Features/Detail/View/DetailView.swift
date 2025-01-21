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
        static let messageErrorToLoadImage = "Image download failed sorry for the incovenience"
        
        enum Accessibility {
            static let loadingViewId = "loading_view"
            static let catImageId = "cat_image_identifier"
            static let asyncCatImageId = "cat_image_identifier_async"
            static let errorViewId = "error_view"
        }
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
            case let .hasError(message):
                errorView(message: message)
                    .accessibilityIdentifier(Constants.Accessibility.errorViewId)
            case let .isLoading(status):
                loadingView(isLoading: status)
                    .accessibilityIdentifier(Constants.Accessibility.loadingViewId)
            }
        }
        .navigationTitle(Constants.navigationTitle)
        .task {
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
                .accessibilityIdentifier(Constants.Accessibility.catImageId)
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
                errorView(message: Constants.messageErrorToLoadImage)
            }
        }
        .accessibilityIdentifier(Constants.Accessibility.asyncCatImageId)
    }

    
    private func errorView(message: String) -> some View {
        ErrorView(textMessage: message)
            .padding()
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
