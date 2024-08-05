//
//  LoginRequest.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case email, password
    }
}
