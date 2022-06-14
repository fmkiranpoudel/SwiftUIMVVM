//
//  NetworkManager.swift
//  MVVM-SampleApp
//
//  Created by Kiran Poudel on 6/13/22.
//

import Foundation
import UIKit

/// Manager that carries api call
class NetworkManager: NSObject {
    
    static let shared = NetworkManager()
    
    private let fetchUrl = "https://testemployeesdata.free.beeceptor.com"
    
    private override init() {}
    
    func getUsers(completed: @escaping (Result<[User], APIError>) -> Void) {
        guard let url = URL(string: fetchUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode([User].self, from: data)
                completed(.success(userResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}



