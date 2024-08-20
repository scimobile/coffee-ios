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
    
    func backgroundColor(_ color: UIColor) {
        self.forEach { item in
            item.backgroundColor = color
        }
    }
    
    func tintColor(_ color: UIColor) {
        self.forEach { item in
            item.tintColor = color
        }
    }
    
    func addFont(_ font: UIFont) {
        self.forEach { item in
            switch item {
            case let label as UILabel:
                label.font = font
            case let button as UIButton:
                button.titleLabel?.font = font
            case let textField as UITextField:
                textField.font = font
            case let textView as UITextView:
                textView.font = font
            default:
                break
            }
        }
    }
}
