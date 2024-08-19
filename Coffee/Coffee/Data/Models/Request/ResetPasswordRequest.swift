//
//  ResetPasswordRequest.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/10/24.
//

import Foundation

struct ResetPasswordRequest: Codable {
    let newPassword: String?
    let confirmPassword: String?
    
    enum CodingKeys: String, CodingKey {
        case newPassword, confirmPassword
    }
}
