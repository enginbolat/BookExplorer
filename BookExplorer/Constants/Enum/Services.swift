//
//  Services.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Moya
import Foundation
internal import Alamofire

enum Services {
    case search(limit: String)
}

extension Services: TargetType {
    var baseURL: URL { URL(string: "https://openlibrary.org/")! }
    
    var path: String {
        switch self {
        case .search(let limit):
            return "/search.json?q=book&sort=random&limit=\(limit)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search(_):
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .search(_):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}

private extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data { Data(self.utf8) }
}
