//
//  CachedNetworkService.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation
import Combine
import Moya

protocol CachedNetworkServiceProtocol {
    func request<T: Codable>(_ target: BookServices, as type: T.Type, cacheKey: String?) -> AnyPublisher<T, Error>
}

final class CachedNetworkService: CachedNetworkServiceProtocol {
    @Injected(NetworkServiceProtocol.self) private var networkService
    @Injected(APICacheServiceProtocol.self) private var cacheService
    @Injected(NetworkConnectivityServiceProtocol.self) private var connectivityService
    
    func request<T: Codable>(_ target: BookServices, as type: T.Type, cacheKey: String? = nil) -> AnyPublisher<T, Error> {
        let key = cacheKey ?? "\(target.path)_\(type)"
        
        // Try to get from cache first
        if let cachedData: T = cacheService.retrieve(T.self, forKey: key) {
            return Just(cachedData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        // If no internet, return cached data or error
        guard connectivityService.isConnected else {
            if let cachedData: T = cacheService.retrieve(T.self, forKey: key) {
                return Just(cachedData)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } else {
                return Fail(error: NetworkError.noInternetConnection)
                    .eraseToAnyPublisher()
            }
        }
        
        // Make network request
        return networkService.request(target, as: type)
            .handleEvents(receiveOutput: { [weak self] data in
                // Cache the response
                self?.cacheService.cache(data, forKey: key, expiration: 3600) // 1 hour cache
            })
            .eraseToAnyPublisher()
    }
}

// MARK: - Network Error

enum NetworkError: LocalizedError {
    case noInternetConnection
    case serverError(Int)
    case invalidData
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "No internet connection available"
        case .serverError(let code):
            return "Server error: \(code)"
        case .invalidData:
            return "Invalid data received"
        case .unknown:
            return "Unknown error occurred"
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .noInternetConnection:
            return "Please check your internet connection and try again"
        case .serverError:
            return "Please try again later"
        case .invalidData:
            return "Please refresh the data"
        case .unknown:
            return "Please try again"
        }
    }
}