//
//  KeychainManager.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import KeychainAccess

class KeychainManager {
    static var shared: KeychainManager = .init()
    private let keychain: Keychain
    private let ACCESS_TOKEN_KEY: String = "ACCESS_TOKEN"
    
    private init() {
        keychain = Keychain(service: "com.coffee.keychain")
    }
    
    func setAccessToken(with token: String) {
        keychain[ACCESS_TOKEN_KEY] = token
    }
    
    func getAccessToken() -> String? {
        return keychain[ACCESS_TOKEN_KEY]
    }
    
    func deleteAccessToken() {
        return keychain[ACCESS_TOKEN_KEY] = nil
    }
}
