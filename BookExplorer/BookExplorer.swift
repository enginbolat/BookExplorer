//
//  CoordinatorApp.swift
//  Coordinator
//
//  Created by Engin Bolat on 17.09.2025.
//

import SwiftUI

@main
struct BookExplorerApp: App {
    
    init() {
        setupDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
        }
    }
    
    private func setupDependencies() {
        let container = DependencyContainer.shared
        
        // Register StorageService
        container.register(StorageServiceProtocol.self) {
            StorageService()
        }
        
        // Register Network Services
        container.register(NetworkServiceProtocol.self) {
            NetworkService()
        }
        
        container.register(BookServiceProtocol.self) {
            BookService()
        }
        
        container.register(BookRepositoryProtocol.self) {
            BookRepository()
        }
        
        // Add these registrations:
        container.register(CachedNetworkServiceProtocol.self) {
            CachedNetworkService()
        }
        
        container.register(APICacheServiceProtocol.self) {
            APICacheService.shared
        }
        
        container.register(NetworkConnectivityServiceProtocol.self) {
            NetworkConnectivityService.shared
        }
    }
}
