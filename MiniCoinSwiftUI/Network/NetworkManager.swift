//
//  NetworkManager.swift
//  MiniCoinSwiftUI
//
//  Created by 권대윤 on 9/10/24.
//

import Foundation
import Alamofire

enum NetworkError: LocalizedError {
    case invalidURL
    case failedToStatusCode(code: Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Error: URL 생성 실패"
        case .failedToStatusCode(let code): return "Error: 에러 상태 코드: \(code)"
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    private init() { }
    
    func performRequest<T: Decodable>(api: Router, model: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let request = try? api.asURLRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(request)
            .validate(statusCode: 200...299)
            .responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error)
                if let code = response.response?.statusCode {
                    completion(.failure(.failedToStatusCode(code: code)))
                }
            }
        }
    }
}
