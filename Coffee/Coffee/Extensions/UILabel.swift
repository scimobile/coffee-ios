//
//  UILabel.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/23/24.
//

import Foundation
import UIKit

extension UILabel {
    func setColoredString(fullString: String, _ color: UIColor, _ text: String, _ state: UIControl.State = .normal) {
        let attributeString = NSMutableAttributedString(string: fullString)
        let range: NSRange = (fullString as NSString).range(of: text)
    
        if range.location != NSNotFound {
            attributeString.addAttribute(.foregroundColor, value: color, range: range)
        }
        self.attributedText =  attributeString
    }
}
