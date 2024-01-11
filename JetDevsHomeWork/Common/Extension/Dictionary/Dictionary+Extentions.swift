//
//  Dictionary+Extentions.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation

extension Dictionary {
    
    var jsonStringRepresentation: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
            return nil
        }
        return String(data: theJSONData, encoding: .ascii)
    }
}
