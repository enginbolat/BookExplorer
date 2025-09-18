//
//  HomeViewModel.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation
import Combine

struct CategoryCardItem: Hashable {
    let key: String
    let image: ImageEnum
}

struct HomeScreenData {
    let recommended: [RandomBook]
    let recentlyViewed: [RandomBook]
}

protocol HomeViewModelProtocol: ObservableObject {
}

final class HomeViewModel: HomeViewModelProtocol {
    @Injected(BookRepositoryProtocol.self) private var repository
    @Published var state: Loadable<HomeScreenData> = .idle
    
    private var cancellables = Set<AnyCancellable>()
    private var coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func updateCoordinator(_ coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    public let categories: [CategoryCardItem] = [
        CategoryCardItem(key: "Fantasy", image: .CategoryFantasy),
        CategoryCardItem(key: "Science Fiction", image: .CategoryScienceFiction),
        CategoryCardItem(key: "Mystery", image: .CategoryMystery),
        CategoryCardItem(key: "Romance", image: .CategoryRomance),
        CategoryCardItem(key: "Horror", image: .CategoryHorror),
        CategoryCardItem(key: "Thriller", image: .CategoryThriller),
        CategoryCardItem(key: "Adventure", image: .CategoryAdventure),
        CategoryCardItem(key: "Love", image: .CategoryLove)
    ]
    
    func fetchSections() {
        self.state = .loading
        Publishers.Zip(
            repository.getRandomBooks(limit: "15"),
            repository.getRandomBooks(limit: "12")
        )
        .map { recommended, recent in
            HomeScreenData(recommended: recommended, recentlyViewed: recent)
        }
        .receive(on: DispatchQueue.main)
        .sink { completion in
            if case let .failure(error) = completion {
                self.state = .failed(error)
            }
        } receiveValue: { data in
            print(data)
            self.state = .loaded(data)
        }
        .store(in: &cancellables)
    }
    
    func navigateToSubject(with subject: String) {
        coordinator.push(page: .Subject(subject: subject))
    }
}
