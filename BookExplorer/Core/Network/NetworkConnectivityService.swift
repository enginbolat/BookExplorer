//
//  NetworkConnectivityService.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation
import Network
import Combine

protocol NetworkConnectivityServiceProtocol {
    var isConnected: Bool { get }
    var connectivityStatus: AnyPublisher<Bool, Never> { get }
}

final class NetworkConnectivityService: NetworkConnectivityServiceProtocol {
    static let shared = NetworkConnectivityService()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkConnectivityQueue")
    
    @Published private var _isConnected: Bool = true
    var isConnected: Bool { _isConnected }
    
    var connectivityStatus: AnyPublisher<Bool, Never> {
        $_isConnected.eraseToAnyPublisher()
    }
    
    private init() {
        startMonitoring()
    }
    
    private func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?._isConnected = path.status == .satisfied
            }
        }
        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
}