//
//  APIEndpoint.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation

enum APIEndpoint {
    
    private static let baseURL = "https://jetdevs.wiremockapi.cloud/"
    
    case login
    
    func url() -> URL? {
        switch self {
        case .login:
            return URL(string: APIEndpoint.baseURL + "login")
        }
    }
}
