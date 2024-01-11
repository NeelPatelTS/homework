//
//  UIViewCotroller+Extentions.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertActionoOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(alertActionoOk)
        present(alert, animated: true)
    }
}
