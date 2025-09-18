//
//  SubjectViewModel.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation
import Combine

protocol SubjectViewModelProtocol: ObservableObject {
    func fetchSubject(_ subject: String) -> Void
}

final class SubjectViewModel: SubjectViewModelProtocol {
    @Injected(BookRepositoryProtocol.self) private var repository
    private var cancellables = Set<AnyCancellable>()
    
    @Published var subjectBooks: [SubjectSt] = []
    @Published var state: Loadable<[SubjectSt]> = .idle
    
    func fetchSubject(_ subject: String) {
        state = .loading
        repository.getSubject(subject: subject)
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
