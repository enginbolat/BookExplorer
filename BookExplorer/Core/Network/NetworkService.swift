//
//  Network.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Moya
import Foundation
import Combine

import Moya
import Combine

protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ target: BookServices, as type: T.Type) -> AnyPublisher<T, Error>
}

final class NetworkService: NetworkServiceProtocol {
    private let provider = MoyaProvider<BookServices>(plugins: [URLLoggerPlugin()])
    
    func request<T: Decodable>(_ target: BookServices, as type: T.Type) -> AnyPublisher<T, Error> {
        Future { promise in
            self.provider.request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let filtered = try response.filterSuccessfulStatusCodes()
                        let decoded = try JSONDecoder().decode(T.self, from: filtered.data)
                        promise(.success(decoded))
                    } catch {
                        promise(.failure(error))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
