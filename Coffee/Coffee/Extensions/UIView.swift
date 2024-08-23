//
//  UIVew.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import UIKit

extension UIView {
    
    func dropShadow(color: UIColor = .white, opacity: Float = 0.3, offSet: CGSize = CGSize(width: 0, height: 2), shadowRadius: CGFloat = 10) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
}
