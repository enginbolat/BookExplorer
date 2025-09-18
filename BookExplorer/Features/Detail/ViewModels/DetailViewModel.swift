//
//  DetailViewModel.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation
import Combine

protocol DetailViewModelProtocol: ObservableObject {
    
}

final class DetailViewModel: DetailViewModelProtocol {
    @Injected(BookRepositoryProtocol.self) private var repository
    private var cancellables = Set<AnyCancellable>()
    
    @Published var state: Loadable<Detail> = .idle
    
    func fetchDetail(for key: String) {
        state = .loading
        repository.getDetails(for: key)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                if case let .failure(error) = completion {
                    print("Error:", error)
                    self.state = .failed(error)
                }
            } receiveValue: { response in
                self.state = .loaded(response)
            }
            .store(in: &cancellables)
    }
}
