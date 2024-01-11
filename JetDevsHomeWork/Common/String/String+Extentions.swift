//
//  String+Extentions.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation

extension String {
    
    func validateEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> Date? {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            let date = dateFormatter.date(from: self)
            return date
    }
}
