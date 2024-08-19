//
//  AuthWrappers.swift
//  Coffee
//
//  Created by Phyo Thiha on 8/19/24.
//

import Foundation

@propertyWrapper
struct UserLoginStatus {
    var wrappedValue: Bool {
        return KeychainManager.shared.getAccessToken() != nil && KeychainManager.shared.getAccessToken() != ""
    }
}
