//
//  Router.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/10/24.
//

import Foundation
import Alamofire

enum Router {
    case trending
}

extension Router: URLRequestConvertible {
    var baseURL: String {
        return "https://api.coingecko.com/api/v3/"
    }
    
    var path: String {
        switch self {
        case .trending: return "search/trending"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var query: [URLQueryItem]? {
        switch self {
        case .trending:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: baseURL + path) else {
            throw URLError(.badURL)
        }
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        urlComponents.queryItems = query
        guard let newURL = urlComponents.url else {
            throw URLError(.badURL)
        }
        request.url = newURL
        
        return request
    }
}
