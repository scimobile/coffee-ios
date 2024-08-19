//
//  ForgotPasswordRequest.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/10/24.
//

import Foundation

struct ForgotPasswordRequest: Codable {
    let email: String?
    
    enum CodingKeys: String, CodingKey {
        case email
    }
}
