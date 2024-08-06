//
//  AuthRepository.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation

class AuthRepository {
    private let remoteDataSource: AuthRemoteDataSource = .init()
    
    func login
    (
        email: String,
        password: String,
        onSuccess: @escaping () -> (),
        onFailed: @escaping (AuthDataError) -> ()
    )
    {
        remoteDataSource.login(
            email: email,
            password: password,
        onSuccess: { token in
            KeychainManager.shared.setAccessToken(with: token)
            onSuccess()
        }, onFailed: onFailed)
    }
    
    func register (
        fullName: String,
        email: String,
        phoneNumber: String,
        password: String,
        onSuccess: @escaping () -> (),
        onFailed: @escaping (AuthDataError) -> ()
    ) {
        remoteDataSource.register(
            fullName: fullName,
            email: email,
            phoneNumber: phoneNumber,
            password: password,
            onSuccess: { token in
                KeychainManager.shared.setAccessToken(with: token)
                onSuccess()
            },
            onFailed: onFailed
        )

    }
}
