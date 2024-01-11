//
//  BaseModel.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    let result: Int?
    let errorMessage: String?
    let responseData: T?
    
    enum CodingKeys: String, CodingKey {
        
        case result = "result"
        case errorMessage = "error_message"
        case responseData = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Int.self, forKey: .result)
        errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage)
        responseData = try? values.decodeIfPresent(T.self, forKey: .responseData)
    }
}
