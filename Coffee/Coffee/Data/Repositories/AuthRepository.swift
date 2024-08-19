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
        onFailed: onFailed)
    }
    
    func forgotPassword(
        email: String,
        onSuccess: @escaping () -> (),
        onFailed: @escaping (AuthDataError) -> ()
    )
    {
        remoteDataSource.forgotPassword(
            email: email,
        onSuccess: {
            //MARK: ToDo
        }, onFailed: onFailed)
    }
    
    func resetPassword(
        newPassowrd: String,
        confirmPassword: String,
        onSuccess: @escaping () -> (),
        onFailed: @escaping (AuthDataError) -> ()
    )
    {
        remoteDataSource.resetPassword(
            newPassword: newPassowrd,
            confirmPassword: confirmPassword,
        onSuccess: {
            //MARK: ToDo
        }, onFailed: onFailed)
    }
}
