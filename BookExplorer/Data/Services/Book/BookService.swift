//
//  BookService.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Moya
import Combine
import Foundation

protocol BookServiceProtocol {
    func fetchRandomBooks(limit: String) -> AnyPublisher<IGenericResponseRandomBook<RandomBook>, Error>
    func fetchSubject(subject: String) -> AnyPublisher<ISubjectGenericResponse<SubjectSt>, Error>
    func fetchDetails(for key: String) -> AnyPublisher<Detail, Error>
}

final class BookService: BookServiceProtocol {
    @Injected(NetworkServiceProtocol.self) private var network
        
    func fetchRandomBooks(limit: String) -> AnyPublisher<IGenericResponseRandomBook<RandomBook>, Error> {
        return network.request(BookServices.search(limit: limit), as: IGenericResponseRandomBook<RandomBook>.self)
    }
    
    func fetchSubject(subject: String) -> AnyPublisher<ISubjectGenericResponse<SubjectSt>,Error> {
        return network.request(BookServices.subject(subject: subject), as: ISubjectGenericResponse<SubjectSt>.self)
    }
    
    func fetchDetails(for key: String) -> AnyPublisher<Detail, any Error> {
        return network.request(BookServices.details(id: key), as: Detail.self)
    }
}
