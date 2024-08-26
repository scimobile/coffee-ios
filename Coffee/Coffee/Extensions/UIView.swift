//
//  UIVew.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import UIKit

extension UIView {
    func addShadow(
        radius: CGFloat = 5,
        opacity: Float = 0.4,
        color: UIColor = .black,
        offset: CGSize = .init(width: 0, height: 0)
    )
    {
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
    }
}
