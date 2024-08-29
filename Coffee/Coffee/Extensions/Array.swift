//
//  Array.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/8/24.
//

import Foundation
import UIKit

extension Array where Element == UIView {
    func addBorder(width: CGFloat = 1, color: UIColor = UIColor(named: "AppGray") ?? .gray) {
        self.forEach { item in
            item.layer.borderWidth = width
            item.layer.borderColor = color.cgColor
        }
    }
    
}

extension Array where Element == UIButton{
    func addTarget(selector:Selector){
        self.forEach { button in
            button.addTarget(self, action: selector, for: .touchUpInside)
        }
    }
}
