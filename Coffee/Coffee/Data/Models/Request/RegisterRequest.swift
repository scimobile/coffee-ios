//
//  RegisterRequest.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-06.
//

import Foundation

struct RegisterRequest: Codable {
    let fullName: String?
    let email: String?
    let phoneNumber: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName, email, phoneNumber, password
    }
}
