//
//  ResetPasswordVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/8/24.
//

import UIKit

class ResetPasswordVC: UIViewController, Storyboarded {

    @IBOutlet weak var tfPasswordView: UIView!
    @IBOutlet weak var tfConfirmPasswordView: UIView!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var btnShowPasswordBtn: UIButton!
    @IBOutlet weak var btnShowConfirmPasswordBtn: UIButton!
    @IBOutlet weak var lblPasswordError: UILabel!
    @IBOutlet weak var lblConfirmPasswordError: UILabel!
    @IBOutlet weak var btnReset: UIButton!
    
    static var storyboardName: String = "Auth"
    
    private var showPassword: Bool = false {
        didSet {
            btnShowPasswordBtn.setImage(UIImage(systemName: showPassword ? "eye.fill" : "eye.slash.fill"), for: .normal)
            btnShowConfirmPasswordBtn.setImage(UIImage(systemName: showPassword ? "eye.fill" : "eye.slash.fill"), for: .normal)
        }
    }
    
    private lazy var vm: ResetPasswordVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        [tfPasswordView, tfConfirmPasswordView].addBorder()
        clearError()
    }
    
    private func setUpBindings() {
        showPassword = false
        tfPassword.addTarget(self, action: #selector(onChangePassword), for: .editingChanged)
        tfConfirmPassword.addTarget(self, action: #selector(onChangeConfirmPassword), for: .editingChanged)
        btnShowPasswordBtn.addTarget(self, action: #selector(onTapShowHidePassword), for: .touchUpInside)
        btnShowConfirmPasswordBtn.addTarget(self, action: #selector(onTapShowHidePassword), for: .touchUpInside)
        btnReset.addTarget(self, action: #selector(onTapReset), for: .touchUpInside)
    }
    
    @objc func onTapShowHidePassword() {
        showPassword.toggle()
        tfPassword.isSecureTextEntry.toggle()
        tfConfirmPassword.isSecureTextEntry.toggle()
    }
    
    @objc func onChangePassword() {
        self.vm.setPassword(password: tfPassword.text)
    }
    
    @objc func onChangeConfirmPassword() {
        self.vm.setConfirmPassword(confirmPass: tfConfirmPassword.text)
    }

    @objc func onTapReset() {
        self.vm.reset()
    }
    
    private func clearError() {
        lblPasswordError.layer.opacity = 0
        lblPasswordError.text = "label"
        lblConfirmPasswordError.layer.opacity = 0
    }
    
    private func setError(label: UILabel, error: String) {
        label.layer.opacity = 1
        label.text = error
    }
}

extension ResetPasswordVC: ResetPasswordViewDelegate {
    
    func onSuccesss() {
        //MARK: ToDo
    }
    
    func onValidate(validationError: [ResetPasswordVM.FormInput]) {
        if validationError.count > 0 {
            clearError()
            btnReset.isEnabled = false
            validationError.forEach { input in
                switch input {
                case .PasswordTextField(let error):
                    setError(label: lblPasswordError, error: error)
                case .ConfirmPasswordTextField(let error):
                    setError(label: lblConfirmPasswordError, error: error)
                }
            }
        }
        else {
            clearError()
            btnReset.isEnabled = true
        }
    }
    
    func onError(error: String) {
        //MARK: ToDo
    }
    
}
