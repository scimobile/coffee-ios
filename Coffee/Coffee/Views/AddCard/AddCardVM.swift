//
//  AddCardVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import Foundation

protocol AddCardVMDelegate {
    func onValidate(validationErrors: [AddCardVM.FormInput])
}

class AddCardVM {
    enum FormInput {
        case CardNumberTextField(String)
        case CardHolderTextField(String)
        case ExpireDateTextField(String)
        case CVVTextField(String)
    }
    
    private let delegate: AddCardVMDelegate
    
    init(delegate: AddCardVMDelegate) {
        self.delegate = delegate
    }
    
    private(set) var cardNumber: String? = nil {
        didSet {
            self.validate()
        }
    }
    
    private(set) var cardHolder: String? = nil {
        didSet {
            self.validate()
        }
    }
    
    private(set) var expireDate: Date? = nil {
        didSet {
            self.validate()
        }
    }
    
    private(set) var cvv: String? = nil {
        didSet {
            self.validate()
        }
    }
    
    func setCardNumber(cardNumber: String?) {
        self.cardNumber = cardNumber
    }
    
    func setCardHolder(cardHolder: String?) {
        self.cardHolder = cardHolder
    }
    
    func setExpireDate(expireDate: Date?) {
        self.expireDate = expireDate
    }
    
    func setCVV(cvv: String?) {
        self.cvv = cvv
    }
    
    private func validate() {
        var errors: [FormInput] = []
        if cardNumber == nil || cardNumber == "" {
            errors.append(.CardNumberTextField("Card number is required."))
        }
        
        if cardHolder == nil || cardHolder == "" {
            errors.append(.CardHolderTextField("CardHolder name is required."))
        }
        
        if expireDate == nil {
            errors.append(.ExpireDateTextField("Expire date is required"))
        }
        
        if cvv == nil || cvv == "" {
            errors.append(.CVVTextField("CVV is required."))
        }
        
        self.delegate.onValidate(validationErrors: errors)
    }
    
    func save() {
        //MARK: ToDo
    }
}
