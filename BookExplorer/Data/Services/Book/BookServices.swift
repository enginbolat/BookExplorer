//
//  BookServices.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Foundation
import Moya
internal import Alamofire

enum BookServices {
    case search(limit: String)
    case subject(subject: String)
    case details(id: String)
}

extension BookServices: TargetType {
    var baseURL: URL { URL(string: "https://openlibrary.org/")! }
    
    var path: String {
        switch self {
        case .search:
            return "search.json"
        case .subject(let subject):
            return "subjects/\(subject.lowercased()).json"
        case .details(let id):
            return "\(id).json"
        }
    }
    
    var method: Moya.Method { .get }
    
    var task: Moya.Task {
            switch self {
            case .search(let limit):
                return .requestParameters(
                    parameters: ["q": "book", "sort": "random", "limit": limit],
                    encoding: URLEncoding.queryString
                )
            case .subject:
                return .requestPlain
            case .details:
                return .requestPlain
            }
        }

    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
