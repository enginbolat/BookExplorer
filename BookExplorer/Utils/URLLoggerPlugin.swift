//
//  URLLoggerPlugin.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import Moya
import Foundation

struct URLLoggerPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        if let request = request.request {
            print("➡️ Request: \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")")
        }
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let response):
            print("✅ Response [\(response.statusCode)] for \(target.path)")
        case .failure(let error):
            print("❌ Error: \(error.localizedDescription)")
        }
    }
}
