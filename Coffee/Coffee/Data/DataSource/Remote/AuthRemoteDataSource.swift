//
//  AuthRemoteDataSource.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation

enum AuthDataError: Error {
    case NEW_USER
    case DUPLICATE_USER
    case UNKNOWN(String)
}

class AuthRemoteDataSource {
    private let network = NetworkManager.shared
    private let newUserErrorCode: Int = 404
    private let duplicateUserErrorCode: Int = 409
    
    func login(
        email: String,
        password: String,
        onSuccess: @escaping (String) -> (),
        onFailed: @escaping (AuthDataError) -> ()
    )
    {
        let request = LoginRequest(email: email, password: password)
        network.request(endPoint: .Login(request)) { (response: LoginResponse) in
            if response.code == 0, let token = response.data?.accessToken, !token.isEmpty {
                onSuccess(token)
            }
        } onFailed: { [weak self] error in
            switch error {
            case .UNEXPECTED_STATUS_CODE(let code):
                if code == self?.newUserErrorCode {
                    onFailed(.NEW_USER)
                }
                else {
                    onFailed(.UNKNOWN(error.customMessage))
                }
            default:
                onFailed(.UNKNOWN(error.customMessage))
            }
        }
    }
}
