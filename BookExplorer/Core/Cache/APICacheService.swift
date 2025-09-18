//
//  APICacheService.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation

protocol APICacheServiceProtocol {
    func cache<T: Codable>(_ data: T, forKey key: String, expiration: TimeInterval?)
    func retrieve<T: Codable>(_ type: T.Type, forKey key: String) -> T?
    func removeCache(forKey key: String)
    func clearAllCache()
}

final class APICacheService: APICacheServiceProtocol {
    static let shared = APICacheService()
    
    private let fileManager = FileManager.default
    private let cacheDirectory: URL
    private let maxCacheSize: Int = 50 * 1024 * 1024 // 50MB
    
    private init() {
        let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        cacheDirectory = documentsPath.appendingPathComponent("APICache")
        
        try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }
    
    func cache<T: Codable>(_ data: T, forKey key: String, expiration: TimeInterval? = 3600) {
        let cacheItem = CacheItem(
            data: data,
            timestamp: Date(),
            expiration: expiration
        )
        
        let fileURL = cacheDirectory.appendingPathComponent("\(key).json")
        
        do {
            let encoded = try JSONEncoder().encode(cacheItem)
            try encoded.write(to: fileURL)
        } catch {
            print("Failed to cache data for key: \(key), error: \(error)")
        }
    }
    
    func retrieve<T: Codable>(_ type: T.Type, forKey key: String) -> T? {
        let fileURL = cacheDirectory.appendingPathComponent("\(key).json")
        
        guard fileManager.fileExists(atPath: fileURL.path) else { return nil }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let cacheItem = try JSONDecoder().decode(CacheItem<T>.self, from: data)
            
            // Check expiration
            if let expiration = cacheItem.expiration {
                let timeSinceCached = Date().timeIntervalSince(cacheItem.timestamp)
                if timeSinceCached > expiration {
                    removeCache(forKey: key)
                    return nil
                }
            }
            
            return cacheItem.data
        } catch {
            print("Failed to retrieve cached data for key: \(key), error: \(error)")
            return nil
        }
    }
    
    func removeCache(forKey key: String) {
        let fileURL = cacheDirectory.appendingPathComponent("\(key).json")
        try? fileManager.removeItem(at: fileURL)
    }
    
    func clearAllCache() {
        try? fileManager.removeItem(at: cacheDirectory)
        try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
    }
}

// MARK: - Cache Item Model

private struct CacheItem<T: Codable>: Codable {
    let data: T
    let timestamp: Date
    let expiration: TimeInterval?
}
