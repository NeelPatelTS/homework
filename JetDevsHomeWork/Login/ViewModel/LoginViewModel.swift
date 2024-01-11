//
//  LoginViewModel.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel {
    
    let emailSubject = BehaviorRelay<String?>(value: "")
    let passwordSubject = BehaviorRelay<String?>(value: "")
    private let disposeBag = DisposeBag()
    private let minPasswordCharacters = 6
    
    var isValidForm: Observable<Bool> {
        return Observable.combineLatest(emailSubject, passwordSubject) { email, password in
            guard email != nil && password != nil else {
                return false
            }
            return (email ?? "").validateEmail() && (password ?? "").count >= self.minPasswordCharacters
        }
    }
    
    func isValidEmail() -> Bool {
        if let value = emailSubject.value {
            return value.validateEmail()
        } else {
            return false
        }
        
    }
    
    func isValidPassword() -> Bool {
        if let value = passwordSubject.value {
            return value.count >= self.minPasswordCharacters
        } else {
            return false
        }
    }
    
}
