//
//  Service.swift
//  DesafioLogs
//
//  Created by Gabriel Barbosa on 25/04/2022.
//

import UIKit

enum APIError: Error {
    
    case invalidURL
    case noResponse
    case noData
    case taskError
}

class APIService {
    
    static let shared = APIService()
    let baseURL = "https://jsonplaceholder.typicode.com/posts"
    
    func getData(completion: @escaping (Result<[UserModel], APIError>) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.taskError))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.noResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let jsonResponse = try JSONDecoder().decode([UserModel].self, from: data)
                completion(.success(jsonResponse))
            } catch {
                completion(.failure(.noData))
            }
        }
        task.resume()
    }
}
