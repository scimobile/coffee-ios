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
    func onError(error: String)
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
        self.repository.forgotPassword(email: email!) { [weak self] in
            //MARK: ToDo
            self?.delegate.onSuccesss()
        } onFailed: { [weak self] error in
            switch error {
            case .NEW_USER:
                self?.delegate.onError(error: "Your email is not registered yet.")
            case .UNKNOWN(let error):
                self?.delegate.onError(error: error)
            default:
                break
            }
        }
    }
}
