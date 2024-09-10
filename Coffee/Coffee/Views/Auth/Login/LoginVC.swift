//
//  LoginVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import UIKit

class LoginVC: UIViewController, Storyboarded {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblOrWith: UILabel!
    @IBOutlet weak var lblGoogleLogin: UILabel!
    @IBOutlet weak var lblFacebookLogin: UILabel!
    @IBOutlet weak var tfEmailView: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var tfPasswordView: UIView!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblPasswordError: UILabel!
    @IBOutlet weak var btnShowHidePassword: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFaceBookLogin: UIButton!
    @IBOutlet weak var btnGoogleView: UIView!
    @IBOutlet weak var btnGoogleLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    static var storyboardName: String = "Auth"
    
    private var showPassword: Bool = false {
        didSet {
            btnShowHidePassword.setImage(UIImage(systemName: showPassword ? "eye.fill" : "eye.slash.fill"), for: .normal)
        }
    }
    
    private lazy var vm: LoginVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }

    private func setUpViews() {
        lblWelcome.font = .popB24
        [tfEmail, tfPassword, btnForgotPassword, btnLogin, lblGoogleLogin, lblFacebookLogin].addFont(.popR14)
        [lblEmailError, lblPasswordError].addFont(.popR13)
        btnSignUp.setColoredString(fullString: btnSignUp.titleLabel?.text ?? "", .primary, "Sign Up")
        [btnLogin, btnForgotPassword].tintColor(.primary)
        [tfEmailView, tfPasswordView, btnGoogleView].addBorder()
        clearError()
    }
    
    private func setUpBindings() {
        showPassword = false
        btnLogin.isEnabled = false
        btnShowHidePassword.addTarget(self, action: #selector(onTapShowHidePassword), for: .touchUpInside)
        tfEmail.addTarget(self, action: #selector(onChangeEmail), for: .editingChanged)
        tfPassword.addTarget(self, action: #selector(onChangePassword), for: .editingChanged)
        btnLogin.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        btnSignUp.addTarget(self, action: #selector(onTapSignUp), for: .touchUpInside)
        btnForgotPassword.addTarget(self, action: #selector(onTapForgotPassword), for: .touchUpInside)
        btnFaceBookLogin.addTarget(self, action: #selector(onTapFacebookLogin), for: .touchUpInside)
        btnGoogleLogin.addTarget(self, action: #selector(onTapGoogleLogin), for: .touchUpInside)
    }
    
    @objc func onTapShowHidePassword() {
        showPassword.toggle()
        tfPassword.isSecureTextEntry.toggle()
    }
    
    @objc func onChangeEmail() {
        self.vm.setEmail(email: tfEmail.text)
    }
    
    @objc func onChangePassword() {
        self.vm.setPassword(password: tfPassword.text)
    }
    
    @objc func onTapLogin() {
        self.vm.login()
    }
    
    @objc func onTapSignUp() {
        let vc = RegisterVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onTapForgotPassword() {
        let vc = ForgotPasswordVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onTapFacebookLogin() {
        self.vm.loginFacebook(self)
    }
    
    @objc func onTapGoogleLogin() {
        self.vm.loginGoogle(self)
    }
    
    private func setError(label: UILabel, error: String) {
        label.layer.opacity = 1
        label.text = error
    }
    
    private func clearError() {
        lblEmailError.layer.opacity = 0
        lblPasswordError.layer.opacity = 0
    }
}

extension LoginVC: LoginViewDelegate {
    
    func onNewUser() {
        //MARK: ToDo
        let vc = RegisterVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func onValidate(validationError: [LoginVM.FormInput]) {
        if validationError.count > 0 {
            btnLogin.isEnabled = false
            clearError()
            validationError.forEach { input in
                switch input {
                case .EmailTextField(let error):
                    setError(label: lblEmailError, error: error)
                case .PasswordTextField(let error):
                    setError(label: lblPasswordError, error: error)
                }
            }
        }
        else {
            btnLogin.isEnabled = true
            clearError()
        }
    }
    
    func onSuccessLogin() {
        //MARK: ToDo
    }
    
    func onError(error: String) {
        //MARK: ToDo
    }
}
