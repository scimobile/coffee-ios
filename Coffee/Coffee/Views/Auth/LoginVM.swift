//
//  LoginVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation

protocol LoginViewDelegate {
    func onValidate(validationError: [LoginVM.FormInput])
    func onSuccessLogin()
    func onError(error: String)
}

class LoginVM {
    enum FormInput {
        case EmailTextField(String)
        case PasswordTextField(String)
    }
    
    private let repository: AuthRepository = .init()
    
    private(set) var email: String? {
        didSet {
            self.onValidate()
        }
    }
    private(set) var password: String? {
        didSet {
            self.onValidate()
        }
    }
    
    private let delegate: LoginViewDelegate
    
    init(delegate: LoginViewDelegate) {
        self.delegate = delegate
    }
    
    func setEmail(email: String?) {
        self.email = email
    }
    
    func setPassword(password: String?) {
        self.password = password
    }
    
    func login() {
        repository.login(email: email!, password: password!) {
            self.delegate.onSuccessLogin()
        } onFailed: { error in
            self.delegate.onError(error: error.localizedDescription)
        }
    }
    
    func onValidate() {
        var errors: [FormInput] = []
        if !email.isEmail {
            errors.append(.EmailTextField("Invalid Email"))
        }
        
        if password == nil || password == "" {
            errors.append(.PasswordTextField("Password is required."))
        }
        self.delegate.onValidate(validationError: errors)
    }
}
