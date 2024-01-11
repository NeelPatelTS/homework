//
//  ErrorMessage.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation

enum ErrorMessage {
    case password
    case email
    case urlInvalid
    case somethingWrong
    
    func value() -> String {
        switch self {
        case .email:
            return "Please enter valid email address."
        case .password:
            return "Password must be 6 characters"
        case .urlInvalid:
            return "URL is not valid"
        case .somethingWrong:
            return "something went wrong"
        }
    }
}
