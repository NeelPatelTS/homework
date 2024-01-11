//
//  UserModel.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation

struct UserModel: Codable {
    let userData: UserData?
    
    enum CodingKeys: String, CodingKey {
        case userData = "user"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userData = try? values.decodeIfPresent(UserData.self, forKey: .userData)
    }
}


struct UserData: Codable {
    let userID: Int?
    let userName: String?
    let userProfileURL: String?
    let createdAt: String?
    var daysago: String? {
        get {
            let date = createdAt?.toDate() ?? Date()
            let components = Set<Calendar.Component>([.day])
            let days = Calendar.current.dateComponents(components, from: date, to: Date()).day ?? 0
            return "Created \(days) days ago"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userName = "user_name"
        case userProfileURL = "user_profile_url"
        case createdAt = "created_at"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userID = try? values.decodeIfPresent(Int.self, forKey: .userID)
        userName = try? values.decodeIfPresent(String.self, forKey: .userName)
        userProfileURL = try? values.decodeIfPresent(String.self, forKey: .userProfileURL)
        createdAt = try? values.decodeIfPresent(String.self, forKey: .createdAt)
    }
}
