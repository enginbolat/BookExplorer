//
//  DependencyContainer.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation

protocol DependencyContainerProtocol {
    func register<T>(_ type: T.Type, factory: @escaping () -> T)
    func resolve<T>(_ type: T.Type) -> T
}

final class DependencyContainer: DependencyContainerProtocol {
    static let shared = DependencyContainer()
    
    private var factories: [String: () -> Any] = [:]
    private var instances: [String: Any] = [:]
    
    private init() {}
    
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        factories[key] = factory
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: type)
        
        // Return existing instance if available
        if let instance = instances[key] as? T {
            return instance
        }
        
        // Create new instance using factory
        guard let factory = factories[key] else {
            fatalError("No factory registered for type: \(type)")
        }
        
        let instance = factory() as! T
        instances[key] = instance
        return instance
    }
}

// MARK: - Property Wrapper for Easy Injection
@propertyWrapper
struct Injected<T> {
    private let type: T.Type
    
    init(_ type: T.Type) {
        self.type = type
    }
    
    var wrappedValue: T {
        DependencyContainer.shared.resolve(type)
    }
}
