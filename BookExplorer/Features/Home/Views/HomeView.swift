//
//  Home.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject private var viewModel = HomeViewModel(coordinator: AppCoordinator())
    private let columns = [GridItem(.flexible()),GridItem(.flexible())]
    
    var body: some View {
        VStack {
            Header(title: "Book Explorer", leftIconVisible: false)
            ScrollView {
                switch viewModel.state {
                case .loading:
                    ProgressView("Loading...")
                case .loaded(let data):
                    VStack {
                        Text("Recommended for you")
                            .font(AppTypography.Heading.h3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, AppSpacing.Padding.lg)
                        RecommendedHorizontalListView(recommendedBookData: data.recommended)
                    }.padding(.bottom, AppSpacing.Component.sectionSpacing)
                    
                    VStack {
                        Text("Recently Viewed")
                            .font(AppTypography.Heading.h3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, AppSpacing.Padding.lg)
                        RecentlyViewedView(recentlyViewedBooks: data.recentlyViewed)
                    }.padding(.bottom, AppSpacing.Component.sectionSpacing)
                    
                    LazyVGrid(columns: columns, spacing: AppSpacing.Component.gridSpacing) {
                        ForEach(viewModel.categories, id: \.self) { category in
                            CategoryItemCard(
                                title: category.key,
                                image: category.image.value,
                                onPress: {
                                    viewModel.navigateToSubject(with: category.key)
                                }
                            )
                        }
                    }.padding(.horizontal, AppSpacing.Padding.lg)
                case .failed(let error):
                    Text("Error: \(error.localizedDescription)")
                default:
                    EmptyView()
                }
            }.onAppear {
                viewModel.updateCoordinator(coordinator)
                if case .idle = viewModel.state {
                    viewModel.fetchSections()
                }
            }
        }
    }
}


#Preview {
    HomeView()
}


