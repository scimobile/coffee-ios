//
//  Colors.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/20/24.
//

import Foundation
import UIKit

extension UIColor {
    
    //MARK: - Colors
    static var primary: UIColor { UIColor(hex: "#A67B5B") }
    static var error: UIColor { UIColor(hex: "#F44336") }
    static var coffeeGray: UIColor { UIColor(hex: "#C6C6C6") }
    
    //MARK: - Added Convenience Initializer for Coverting RGB From Hex
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        assert(hexString.count == 6, "Invalid Color Code")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red: CGFloat = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
