//
//  UIColor+Colors.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import UIKit

extension UIColor {
    
    enum ColorName: String {
        case appBlue = "app_blue_color"
    }
    
    convenience init?(named: ColorName) {
        self.init(named: named.rawValue)
    }
    
    static func named(_ colorName: ColorName) -> UIColor? {
        return UIColor(named: colorName)
    }
}
