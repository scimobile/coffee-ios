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

    func addShadow(
        radius: CGFloat = 5,
        opacity: Float = 0.4,
        color: UIColor = .black,
        offset: CGSize = .init(width: 0, height: 0)
    ) 
    {
        self.forEach { item in
            item.addShadow(
                radius: radius,
                opacity: opacity,
                color: color,
                offset: offset
            )
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
    
    func isHidden(_ isHidden: Bool) {
        self.forEach { item in
            item.isHidden = isHidden
        }
    }
    
    func opacity(_ opacity: Float) {
        self.forEach { item in
            item.layer.opacity = opacity
        }
    }
}

extension Array where Element == UILabel {
    func textColor(color: UIColor) {
        self.forEach { label in
            label.textColor = color
        }
    }
}
