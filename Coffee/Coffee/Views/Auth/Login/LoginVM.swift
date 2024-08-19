//
//  LoginVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import GoogleSignIn
import FacebookLogin

protocol LoginViewDelegate {
    func onValidate(validationError: [LoginVM.FormInput])
    func onSuccessLogin()
    func onError(error: String)
    func onNewUser()
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
        repository.login(email: email!, password: password!) { [weak self] in
            //MARK: ToDo
            self?.delegate.onSuccessLogin()
        } onFailed: { [weak self] error in
            switch error {
            case .NEW_USER:
                self?.delegate.onNewUser()
            case .UNKNOWN(let error):
                self?.delegate.onError(error: error)
            default:
                break
            }
        }
    }
    
    func loginGoogle(_ parentVC: UIViewController) {
        GIDSignIn.sharedInstance.signIn(withPresenting: parentVC) { result, error in
            guard error == nil else { return }
            guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }
            //MARK: ToDo
        }
    }
    
    func loginFacebook(_ parentVC: UIViewController) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: parentVC) { result, error in
            guard error == nil else { return }
            guard let token = result?.token?.tokenString else { return }
            //MARK: ToDo
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
