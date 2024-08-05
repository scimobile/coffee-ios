//
//  UIVew.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import UIKit

extension UIView {
    
    func addBorder(width: CGFloat = 1, color: UIColor = UIColor(named: "AppGray") ?? .gray) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
