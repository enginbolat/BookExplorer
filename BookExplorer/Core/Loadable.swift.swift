//
//  Loadable.swift.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

enum Loadable<T> {
    case idle
    case loading
    case loaded(T)
    case failed(Error)
}

extension Loadable {
    var value: T? {
        if case .loaded(let data) = self {
            return data
        }
        return nil
    }

    var error: Error? {
        if case .failed(let err) = self {
            return err
        }
        return nil
    }

    var isLoading: Bool {
        if case .loading = self { return true }
        return false
    }
}
