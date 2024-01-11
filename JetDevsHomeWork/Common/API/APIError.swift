//
//  APIError.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case networkError(Error)
    
}

enum ErrorModel: Error {
    case unknown(error: String)
    
    func description() -> String {
        switch self {
            
        case .unknown(let error):
            return error
        }
    }
}
