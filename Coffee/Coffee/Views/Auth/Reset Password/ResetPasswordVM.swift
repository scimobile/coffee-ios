//
//  ResetPasswordVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/8/24.
//

import Foundation

protocol ResetPasswordViewDelegate {
    func onSuccesss()
    func onValidate(validationError: [ResetPasswordVM.FormInput])
    func onFailed(error: String)
}

class ResetPasswordVM {
    enum FormInput {
        case PasswordTextField(String)
        case ConfirmPasswordTextField(String)
    }
    
    private let repository: AuthRepository = .init()
    
    private let delegate: ResetPasswordViewDelegate
    
    init(delegate: ResetPasswordViewDelegate) {
        self.delegate = delegate
    }
    
    private(set) var password: String? {
        didSet {
            self.validate()
        }
    }
    
    private(set) var confirmPassword: String? {
        didSet {
            self.validate()
        }
    }
    
    func setPassword(password: String?) {
        self.password = password
    }
    
    func setConfirmPassword(confirmPass: String?) {
        self.confirmPassword = confirmPass
    }
    
    func validate() {
        var errors: [FormInput] = []
        
        if !password.isValidPassword {
            errors.append(.PasswordTextField("Password must be at least 8 characters long, include at least one digit, one letter, and one special character."))
        }
        
        if confirmPassword == nil || confirmPassword == "" {
            errors.append(.ConfirmPasswordTextField("Confirm password is required."))
        }
        else if confirmPassword != password {
            errors.append(.ConfirmPasswordTextField("Passwords must be same"))
        }
        self.delegate.onValidate(validationError: errors)
    }
    
    func submit() {
        
    }
}
