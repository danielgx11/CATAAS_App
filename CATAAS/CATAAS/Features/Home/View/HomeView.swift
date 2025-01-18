//
//  HomeView.swift
//  CATAAS
//
//  Created by Daniel Gomes Xavier on 17/01/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - METRICS
    
    fileprivate enum ViewMetrics {
        static let borderWidth: CGFloat = 1
    }
    
    fileprivate enum Constants {
        static let navigationTitle = "Cat as a Service"
    }
    
    // MARK: - PROPERTIES
    
    @Bindable private var viewModel: HomeViewModel
    
    // MARK: - INITIALIZERS
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case let .hasData(homeViewEntity):
                contentView(with: homeViewEntity)
                    .navigationTitle(Constants.navigationTitle)
            case .hasError:
                errorView()
            case let .isLoading(status):
                loadingView(isLoading: status)
                    .accessibilityIdentifier("loading_view")
            }
        }
        .task {
            viewModel.fetchItems()
        }
    }
    
    private func contentView(with items: [HomeViewEntity]) -> some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(items, id: \.identifier) { item in
                    cellView(item: item)
                        .accessibilityIdentifier("item_cell")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .onTapGesture {
                            viewModel.goToDetails(with: item.identifier)
                        }
                }
            }
        }
    }
    
    private func cellView(item: HomeViewEntity) -> some View {
        VStack(alignment: .leading, spacing: Metrics.nano) {
            HStack {
                Text(item.identifier)
                
                Spacer()
                
                createdAtDateView(item.formattedCreatedAtDate)
            }
            
            tagView(tags: item.tags)
        }
    }
    
    private func createdAtDateView(_ createdAt: String) -> some View {
        Text(createdAt)
            .foregroundStyle(.black)
            .padding(Metrics.nano)
            .font(.caption2)
            .overlay {
                RoundedRectangle(cornerRadius: Metrics.tiny)
                    .stroke(.gray, lineWidth: ViewMetrics.borderWidth)
            }
    }
    
    private func tagView(tags: [String]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .foregroundStyle(.white)
                        .padding(Metrics.nano)
                        .background(Colors.allCases.randomElement()?.color ?? Color.gray)
                        .font(.caption)
                        .frame(alignment: .leading)
                        .clipShape(.rect(cornerRadius: Metrics.tiny))
                }
            }
        }
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
    let useCase = HomeUseCase(service: service)
    let factory = HomeViewFactory()
    let coordinatorFactory = HomeFactoryViewController()
    let coordinator = HomeCoordinator(factory: coordinatorFactory,
                                      navigationController: UINavigationController())
    HomeView(viewModel: HomeViewModel(useCase: useCase,
                                      factory: factory,
                                      coordinator: coordinator))
}
