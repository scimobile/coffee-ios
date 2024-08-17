//
//  AppColor.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/15/24.
//

import UIKit

import UIKit

enum AppColor: String {
    case primary = "coffee-primary"
    case secondary = "coffee-secondary"
    case lightGray = "light-gray"
    case darkBlue = "dark-blue"
    case eggWhite = "egg-white"
    case coffeeRed = "coffee-red"
    
    var color: UIColor {
        return UIColor(named: self.rawValue) ?? UIColor.clear
    }
}
