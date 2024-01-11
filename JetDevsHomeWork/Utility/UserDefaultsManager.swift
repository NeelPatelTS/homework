//
//  UserDefaultsManager.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation

class UserDefaultsManager: NSObject {
    
    static let shared   = UserDefaultsManager()
    private let uDefault = UserDefaults.standard
    
    var userDetails: UserData? {
        get {
            getData(objectType: UserData.self,
                         forKey: Constants.UserDefaultsKey.userDetails.rawValue)
        }
        
        set {
            guard let udata = newValue else {
                return
            }
            setData(data: udata,
                         forKey: Constants.UserDefaultsKey.userDetails.rawValue)
        }
    }
    
    var token: String? {
        get {
            uDefault.string(forKey: Constants.UserDefaultsKey.token.rawValue)
        }
        
        set {
            guard let str = newValue else {
                return
            }
            uDefault.set(str,
                         forKey: Constants.UserDefaultsKey.token.rawValue)
        }
    }
    
    var isUserLogin: Bool {
        get {
            uDefault.bool(forKey: Constants.UserDefaultsKey.isLogin.rawValue)
        }
        
        set {
            uDefault.set(newValue, forKey: Constants.UserDefaultsKey.isLogin.rawValue)
        }
        
    }
    
    private func setData<T: Codable>(data: T, forKey key: String) {
        do {
            let jsonData = try JSONEncoder().encode(data)
            uDefault.set(jsonData, forKey: key)
            uDefault.synchronize()
        } catch let error {
            print(error)
        }
    }
    
    private func getData<T: Codable>(objectType: T.Type, forKey key: String) -> T? {
        guard let result = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try JSONDecoder().decode(objectType, from: result)
        } catch let error {
            print(error)
            return nil
        }
    }
}
