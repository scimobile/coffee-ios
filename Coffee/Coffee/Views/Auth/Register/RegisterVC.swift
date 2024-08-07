//
//  RegisterVC.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-06.
//

import UIKit

class RegisterVC: UIViewController, Storyboarded {
    
    @IBOutlet weak var tfFullNameView: UIView!
    @IBOutlet weak var tfEmailView: UIView!
    @IBOutlet weak var tfPhoneNumberView: UIView!
    @IBOutlet weak var tfPasswordView: UIView!
    @IBOutlet weak var tfConfirmView: UIView!
    @IBOutlet weak var btnGoogleLoginView: UIView!
    
    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirm: UITextField!
    
    @IBOutlet weak var lblFullNameError: UILabel!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var lblPhoneNumberError: UILabel!
    @IBOutlet weak var lblPasswordError: UILabel!
    @IBOutlet weak var lblConfirmError: UILabel!
    
    @IBOutlet weak var btnShowPasswordBtn: UIButton!
    @IBOutlet weak var btnShowConfirmBtn: UIButton!
    @IBOutlet weak var btnRegisterBtn: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFacebookLogin: UIButton!
    @IBOutlet weak var btnGoogleLogin: UIButton!
    
    static var storyboardName: String = "Auth"
    
    private var showPassword: Bool = false {
        didSet {
            btnShowPasswordBtn.setImage(UIImage(systemName: showPassword ? "eye.fill" : "eye.slash.fill"), for: .normal)
            btnShowConfirmBtn.setImage(UIImage(systemName: showPassword ? "eye.fill" : "eye.slash.fill"), for: .normal)
        }
    }
    
    private lazy var vm = RegisterVM(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        tfFullNameView.addBorder()
        tfEmailView.addBorder()
        tfPhoneNumberView.addBorder()
        tfPasswordView.addBorder()
        tfConfirmView.addBorder()
        btnGoogleLoginView.addBorder()
        clearError()
    }
    
    private func setUpBindings() {
        showPassword = false
        btnRegisterBtn.isEnabled = false
        btnShowPasswordBtn.addTarget(self, action: #selector(onTapShowHidePassword), for: .touchUpInside)
        tfFullName.addTarget(self, action: #selector(onChangeFullName), for: .editingChanged)
        tfEmail.addTarget(self, action: #selector(onChangeEmail), for: .editingChanged)
        tfPhoneNumber.addTarget(self, action: #selector(onChangePhoneNumber), for: .editingChanged)
        tfPassword.addTarget(self, action: #selector(onPasswordChange), for: .editingChanged)
        tfConfirm.addTarget(self, action: #selector(onChangeConfirm), for: .editingChanged)
        
        btnRegisterBtn.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
        btnLogin.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        btnFacebookLogin.addTarget(self, action: #selector(onTapFacebookLogin), for: .touchUpInside)
        btnGoogleLogin.addTarget(self, action: #selector(onTapGoogleLogin), for: .touchUpInside)
        
    }
    
    @objc func onTapGoogleLogin() {
        
    }
    
    @objc func onTapFacebookLogin() {
        
    }
    
    @objc func onTapLogin() {
        
    }
    
    @objc func onTapRegister() {
        self.vm.register()
    }
    
    @objc func onChangeConfirm() {
        self.vm.setConfirm(confirm: tfConfirm.text)
    }
    
    @objc func onPasswordChange() {
        self.vm.setPassword(password: tfPassword.text)
    }
    
    @objc func onChangePhoneNumber() {
        self.vm.setPhoneNumber(phoneNumber: tfPhoneNumber.text)
    }
    
    @objc func onChangeEmail() {
        self.vm.setEmail(email: tfEmail.text)
    }
    
    @objc func onChangeFullName() {
        self.vm.setFullName(fullName: tfFullName.text)
    }
    
    @objc func onTapShowHidePassword() {
        showPassword.toggle()
        tfPassword.isSecureTextEntry.toggle()
        tfConfirm.isSecureTextEntry.toggle()
    }
    
    private func clearError() {
        lblFullNameError.layer.opacity = 0
        lblEmailError.layer.opacity = 0
        lblPhoneNumberError.layer.opacity = 0
        lblPasswordError.text = "label"
        lblPasswordError.layer.opacity = 0
        lblConfirmError.layer.opacity = 0
    }
    
    private func setError(label: UILabel, error: String) {
        label.layer.opacity = 1
        label.text = error
    }

}

extension RegisterVC: RegisterViewDelegate {
    func onValidate(validationError: [RegisterVM.FormInput]) {
        if !validationError.isEmpty {
            btnRegisterBtn.isEnabled = false
            clearError()
            validationError.forEach { input in
                switch input {
                    case .FullNameTextField(let error):
                        setError(label: lblFullNameError, error: error)
                    case .EmailTextField(let error):
                        setError(label: lblEmailError, error: error)
                    case .PhoneNumberTextFiled(let error):
                        setError(label: lblPhoneNumberError, error: error)
                    case .PasswordTextField(let error):
                        setError(label: lblPasswordError, error: error)
                    case .ConfirmTextField(let error):
                        setError(label: lblConfirmError, error: error)
                }
            }
        } else {
            btnRegisterBtn.isEnabled = true
            clearError()
        }
    }
    
    func onSuccessRegister() {
        
    }
    
    func onError(error: String) {
        
    }
    
    
}
