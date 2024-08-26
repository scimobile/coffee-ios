//
//  Date.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/23/24.
//

import Foundation

extension Date {
    var creditExpireDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/YY"
        return formatter.string(from: self)
    }
}
