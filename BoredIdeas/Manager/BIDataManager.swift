//
//  APIManager.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 17.05.2023.
//

import Foundation

class BIDataManager {
    static let shared = BIDataManager()
    
    private init() {}
    
    private struct Constants {
        static let baseURL = "https://www.boredapi.com/api/activity/"
    }
    
    enum BIDataManagerError: Error {
        case failedToGetData
        case failedToProceedRequest
    }
    
    public func fetch<T: Codable>(_ url: String, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(error ?? BIDataManagerError.failedToGetData))
                return
            }
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
