//
//  LoginResponse.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation

typealias RegisterResponse = LoginResponse

struct LoginResponse: Codable {
    let code: Int?
    let message: String?
    let data: LoginVO?
    
    enum CodingKeys: String, CodingKey {
        case code, message, data
    }
}

struct LoginVO: Codable {
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
