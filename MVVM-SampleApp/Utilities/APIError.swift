//
//  APIError.swift
//  MVVM-SampleApp
//
//  Created by Kiran Poudel on 6/14/22.
//

/// Error during API call
enum APIError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "URL is not valied"
        case .unableToComplete: return "Unable to complete request"
        case .invalidResponse: return "Invalid Response"
        case .invalidData: return "Invalid Data"
        }
    }
}
