//
//  UIImage+ImageName.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation
import UIKit

extension UIImage {
    
    enum AssetIdentifier: String {
        case closeButton = "close"
        case appLogo = "logo"
    }
    
    convenience init?(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}
