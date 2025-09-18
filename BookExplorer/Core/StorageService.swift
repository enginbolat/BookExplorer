//
//  StorageService.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation

protocol StorageServiceProtocol {
    func set<T: Codable>(_ value: T, forKey key: StorageEnum)
    func get<T: Codable>(forKey key: StorageEnum, as type: T.Type) -> T?
    func remove(forKey key: StorageEnum)
}

final class StorageService: StorageServiceProtocol {
    private var defaults = UserDefaults.standard
    
    init(defaults: UserDefaults = UserDefaults.standard) {
        self.defaults = defaults
    }
    
    func set<T>(_ value: T, forKey key: StorageEnum) where T : Decodable, T : Encodable {
        if let data = try? JSONEncoder().encode(value) {
            defaults.set(data, forKey: key.value)
            defaults.synchronize()
        }
    }
    
    func get<T>(forKey key: StorageEnum, as type: T.Type) -> T? where T : Decodable, T : Encodable {
        guard let data = defaults.data(forKey: key.value),
              let value = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        
        return value
    }
    
    func remove(forKey key: StorageEnum) {
        defaults.removeObject(forKey: key.value)
        defaults.synchronize()
    }
}
