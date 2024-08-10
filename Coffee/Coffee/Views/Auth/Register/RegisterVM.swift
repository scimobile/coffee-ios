//
//  RegisterVM.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-06.
//

import Foundation
import GoogleSignIn
import FacebookLogin

protocol RegisterViewDelegate {
    func onValidate(validationError: [RegisterVM.FormInput])
    func onSuccessRegister()
    func onError(error: String)
}

class RegisterVM {
    
    enum FormInput {
        case FullNameTextField(String)
        case EmailTextField(String)
        case PhoneNumberTextFiled(String)
        case PasswordTextField(String)
        case ConfirmTextField(String)
    }
    
    private let repository = AuthRepository()
    
    private(set) var fullName: String? {
        didSet {
            self.onValidate()
        }
    }
    
    private(set) var email: String? {
        didSet {
            self.onValidate()
        }
    }
    
    private(set) var phoneNumber: String? {
        didSet {
            self.onValidate()
        }
    }
    
    private(set) var password: String? {
        didSet {
            self.onValidate()
        }
    }
    
    private(set) var confirm: String? {
        didSet {
            self.onValidate()
        }
    }
    
    func setFullName(fullName: String?) {
        self.fullName = fullName
    }
    
    func setEmail(email: String?) {
        self.email = email
    }
    
    func setPhoneNumber(phoneNumber: String?) {
        self.phoneNumber = phoneNumber
    }
    
    func setPassword(password: String?) {
        self.password = password
    }
    
    func setConfirm(confirm: String?) {
        self.confirm = confirm
    }
    
    private let delegate: RegisterViewDelegate
    
    init(delegate: RegisterViewDelegate) {
        self.delegate = delegate
    }
    
    func onValidate() {
        var errors: [FormInput] = []
        
        if fullName == nil || fullName == "" {
            errors.append(.FullNameTextField("Full Name is required."))
        }
        
        if !email.isEmail {
            errors.append(.EmailTextField("Invalid Email"))
        }
        
        if phoneNumber == nil || phoneNumber == "" {
            errors.append(.PhoneNumberTextFiled("Phone Number is required."))
        }
        
        if !password.isValidPassword {
            errors.append(.PasswordTextField("""
                At least 8 character.
                At least one 1 digit.
                At least one character.
                At least one special character.
                """))
        }
        if password != confirm {
            errors.append(.ConfirmTextField("Password must be the same."))
        }
        
        self.delegate.onValidate(validationError: errors)
    }
    
    func register() {
        repository.register(
            fullName: fullName!,
            email: email!,
            phoneNumber: phoneNumber!,
            password: password!) { [weak self] in
                self?.delegate.onSuccessRegister()
            } onFailed: { [weak self] error in
                self?.delegate.onError(error: error.localizedDescription)
            }
    }
    
    func registerGoogle(_ parentVC: UIViewController) {
        GIDSignIn.sharedInstance.signIn(withPresenting: parentVC) { result, error in
            guard error == nil else { return }
            guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }
        }
    }
    
    func registerFacebook(_ parentVC: UIViewController) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: parentVC) { result, error in
            guard error == nil else { return }
            guard let token = result?.token?.tokenString else { return }
            //MARK: ToDo
        }
    }
    
}
