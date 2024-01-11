//
//  UIImageView+Extentions.swift
//  JetDevsHomeWork
//
//  Created by Neel on 11/01/24.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        self.kf.setImage(with: url, placeholder: UIImage(named: "Avatar"))
    }
}
