//
//  AppFont.swift
//  Coffee
//
//  Created by Sithu Win on 11/08/2024.
//

import UIKit

enum AppFont:String{
    case poppinsBold = "Poppins-Bold"
    case poppinsMedium = "Poppins-Medium"
    case poppinsRegular = "Poppins-Regular"
    case poppinsSemibold = "Poppins-SemiBold"
    
    func of(size: CGFloat) -> UIFont {
            return UIFont(name: self.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
        }
}
