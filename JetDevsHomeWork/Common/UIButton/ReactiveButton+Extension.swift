//
//  ReactiveButton+Extension.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation
import RxSwift
import RxCocoa

extension Reactive where Base: UIButton {

    var valid: AnyObserver<Bool> {
        return Binder(base, binding: { (button: UIButton, valid: Bool) in
            button.isEnabled = valid
            button.backgroundColor = valid ? UIColor(named: "app_blue_color") : .lightGray
        }).asObserver()
    }
}
