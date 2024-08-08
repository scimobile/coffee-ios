//
//  ForgotPasswordVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/8/24.
//

import Foundation

protocol ForgotPasswordViewDelegate {
    func onSuccesss()
    func onValidate(validationError: [ForgotPasswordVM.FormInput])
    func onFailed(error: String)
}

class ForgotPasswordVM {
    enum FormInput {
        case EmailTextField(String)
    }
    
    private let repository: AuthRepository = .init()
    
    private let delegate: ForgotPasswordViewDelegate
    
    init(delegate: ForgotPasswordViewDelegate) {
        self.delegate = delegate
    }
    
    private(set) var email: String? {
        didSet {
            self.validate()
        }
    }
    
    func setEmail(email: String?) {
        self.email = email
    }
    
    func validate() {
        var errors: [FormInput] = []
        
        if !email.isEmail {
            errors.append(.EmailTextField("Invalid Email"))
        }
        self.delegate.onValidate(validationError: errors)
    }
    
    func submit() {
        
    }
}
