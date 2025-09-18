//
//  BookRepository.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Combine
import Foundation

protocol BookRepositoryProtocol {
    func getRandomBooks(limit: String) -> AnyPublisher<[RandomBook], Error>
    func getSubject(subject: String) -> AnyPublisher<[SubjectSt], Error>
    func getDetails(for key: String) -> AnyPublisher<Detail,Error>
}

final class BookRepository: BookRepositoryProtocol {
    @Injected(BookServiceProtocol.self) private var service
    
    func getRandomBooks(limit: String) -> AnyPublisher<[RandomBook], any Error> {
        service.fetchRandomBooks(limit: limit)
            .map { $0.docs ?? [] }
            .eraseToAnyPublisher()
    }
    
    func getSubject(subject: String) -> AnyPublisher<[SubjectSt], any Error> {
        service.fetchSubject(subject: subject)
            .map { $0.works }
            .eraseToAnyPublisher()
    }
    
    func getDetails(for key: String) -> AnyPublisher<Detail, any Error> {
        service.fetchDetails(for: key)
            .eraseToAnyPublisher()
    }
}
