//
//  AddCard.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import UIKit

class AddCardVC: UIViewController, Storyboarded {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblNav: UILabel!
    @IBOutlet weak var lblCardNumber: UILabel!
    @IBOutlet weak var tfCardNumber: UITextField!
    @IBOutlet weak var lblCardNumberError: UILabel!
    @IBOutlet weak var viewCardNumber: UIView!
    @IBOutlet weak var lblCardHolder: UILabel!
    @IBOutlet weak var tfCardHolder: UITextField!
    @IBOutlet weak var lblCardHolderError: UILabel!
    @IBOutlet weak var viewCardHolder: UIView!
    @IBOutlet weak var lblExpire: UILabel!
    @IBOutlet weak var tfExpire: UITextField!
    @IBOutlet weak var lblExpireError: UILabel!
    @IBOutlet weak var viewExpire: UIView!
    @IBOutlet weak var lblCVV: UILabel!
    @IBOutlet weak var tfCVV: UITextField!
    @IBOutlet weak var lblCVVError: UILabel!
    @IBOutlet weak var viewCVV: UIView!
    @IBOutlet weak var lblCardDetail: UILabel!
    @IBOutlet weak var lblRefunded: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    
    static var storyboardName: String = "Cart"
    
    private lazy var vm: AddCardVM = .init(delegate: self)
    
    private lazy var datePicker: UIDatePicker = {
        let picker: UIDatePicker = .init()
        if #available(iOS 17.4, *) {
            picker.datePickerMode = .yearAndMonth
        }
        else {
            picker.datePickerMode = .date
        }
        picker.minimumDate = Date()
        picker.locale = Locale(identifier: "en_US_POSIX")
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        [btnBack, btnSave].tintColor(.primary)
        [
            viewCardNumber,
            viewCardHolder,
            viewExpire,
            viewCVV
        ].addBorder()
        [
            lblNav,
            lblCardNumber,
            lblCardHolder,
            lblExpire,
            lblCVV
        ].addFont(.popR15)
        [
            tfCardNumber,
            tfCardHolder,
            tfExpire,
            tfCVV,
            lblCardDetail,
            lblRefunded
        ].addFont(.popR14)
        [
            lblCardNumberError,
            lblCardHolderError,
            lblExpireError,
            lblCVVError
        ].addFont(.popR13)
        [
            lblCardNumberError,
            lblCardHolderError,
            lblExpireError,
            lblCVVError
        ].textColor(color: .error)
        tfExpire.inputView = datePicker
        tfExpire.delegate = self
        tfCardNumber.keyboardType = .numberPad
        tfCVV.keyboardType = .numberPad
        clearError()
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
        btnSave.addTarget(self, action: #selector(onTapSave), for: .touchUpInside)
        btnSave.isEnabled = false
        tfCardNumber.addTarget(self, action: #selector(onChangeCardNumber), for: .editingChanged)
        tfCardHolder.addTarget(self, action: #selector(onChangeCardHolder), for: .editingChanged)
        tfCVV.addTarget(self, action: #selector(onChangeCVV), for: .editingChanged)
        datePicker.addTarget(self, action: #selector(onChangeExpireDate), for: .valueChanged)
        tfExpire.iq.addDone(target: self, action: #selector(onChangeExpireDate))
    }
    
    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapSave() {
        //MARK: ToDo
        self.vm.save()
    }
    
    @objc func onChangeCardNumber() {
        self.vm.setCardNumber(cardNumber: tfCardNumber.text)
    }
    
    @objc func onChangeCardHolder() {
        self.vm.setCardHolder(cardHolder: tfCardHolder.text)
    }
    
    @objc func onChangeExpireDate() {
        tfExpire.text = datePicker.date.creditExpireDate
        self.vm.setExpireDate(expireDate: datePicker.date)
        self.tfExpire.resignFirstResponder()
    }
    
    @objc func onChangeCVV() {
        self.vm.setCVV(cvv: tfCVV.text)
    }

    private func setError(label: UILabel, error: String) {
        label.layer.opacity = 1
        label.text = error
    }
    
    private func clearError() {
        [
            lblCardNumberError,
            lblCardHolderError,
            lblExpireError,
            lblCVVError
        ].opacity(0)
    }
}

extension AddCardVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

extension AddCardVC: AddCardVMDelegate {
    func onValidate(validationErrors: [AddCardVM.FormInput]) {
        if validationErrors.count > 0 {
            btnSave.isEnabled = false
            clearError()
            validationErrors.forEach { input in
                switch input {
                case .CardNumberTextField(let error):
                    setError(label: lblCardNumberError, error: error)
                case .CardHolderTextField(let error):
                    setError(label: lblCardHolderError, error: error)
                case .ExpireDateTextField(let error):
                    setError(label: lblExpireError, error: error)
                case .CVVTextField(let error):
                    setError(label: lblCVVError, error: error)
                }
            }
        }
        else {
            btnSave.isEnabled = true
            clearError()
        }
    }
}
