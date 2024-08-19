//
//  ForgotPasswordVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/8/24.
//

import UIKit

class ForgotPasswordVC: UIViewController, Storyboarded {

    @IBOutlet weak var tfEmailView: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    static var storyboardName: String = "Auth"
    
    private lazy var vm: ForgotPasswordVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpBindings()
    }

    private func setUpViews() {
        [tfEmailView].addBorder()
        clearError()
    }
    
    private func setUpBindings() {
        btnSubmit.isEnabled = false
        tfEmail.addTarget(self, action: #selector(onChangeEmail), for: .editingChanged)
        btnSubmit.addTarget(self, action: #selector(onTapSubmit), for: .touchUpInside)
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
    }
    
    @objc func onChangeEmail() {
        self.vm.setEmail(email: tfEmail.text)
    }
    
    @objc func onTapSubmit() {
        let vc = ResetPasswordVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
        //self.vm.submit()
    }
    
    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func clearError() {
        lblEmailError.layer.opacity = 0
    }
    
    private func setError(label: UILabel, error: String) {
        label.layer.opacity = 1
        label.text = error
    }
}

extension ForgotPasswordVC: ForgotPasswordViewDelegate {
    func onSuccesss() {
        //MARK: ToDo
    }
    
    func onValidate(validationError: [ForgotPasswordVM.FormInput]) {
        if validationError.count > 0 {
            clearError()
            btnSubmit.isEnabled = false
            validationError.forEach { input in
                switch input {
                case .EmailTextField(let error):
                    setError(label: lblEmailError, error: error)
                }
            }
        }
        else {
            clearError()
            btnSubmit.isEnabled = true
        }
    }
    
    func onError(error: String) {
        //MARK: ToDo
    }
}
