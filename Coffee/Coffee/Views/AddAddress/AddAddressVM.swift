//
//  AddAddressVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import Foundation

protocol AddAddressVMDelegate {
    func onValidate(validationErrors: [AddAddressVM.FormInput])
}

class AddAddressVM {
    enum FormInput {
        case RecipientNameTextField(String)
        case PhoneNumberTextField(String)
        case CityDistinctTextField(String)
        case HouseNoTextField(String)
    }
    
    private let delegate: AddAddressVMDelegate
    
    init(delegate: AddAddressVMDelegate) {
        self.delegate = delegate
    }
    
    private(set) var recipientName: String? = nil {
        didSet {
            self.validate()
        }
    }
    
    private(set) var phoneNumber: String? = nil {
        didSet {
            self.validate()
        }
    }
    
    private(set) var cityDistinct: String? = nil {
        didSet {
            self.validate()
        }
    }
    
    private(set) var houseStreet: String? = nil {
        didSet {
            self.validate()
        }
    }
    
    private(set) var unitFloor: String? = nil
    
    private(set) var note: String? = nil
    
    private(set) var isDefaultAddress: Bool = true
    
    func setRecipientName(recipientName: String?) {
        self.recipientName = recipientName
    }
    
    func setPhoneNumber(phoneNumber: String?) {
        self.phoneNumber = phoneNumber
    }
    
    func setCityDistinct(cityDistinct: String?) {
        self.cityDistinct = cityDistinct
    }
    
    func setHouseStreet(houseStreet: String?) {
        self.houseStreet = houseStreet
    }
    
    func setUnitFloor(unitFloor: String?) {
        self.unitFloor = unitFloor
    }
    
    func setNote(note: String?) {
        self.note = note
    }
    
    func setIsDefaultAddress(isDefaultAddress: Bool) {
        self.isDefaultAddress = isDefaultAddress
    }
    
    private func validate() {
        var errors: [FormInput] = []
        if self.recipientName == nil || self.recipientName == "" {
            errors.append(.RecipientNameTextField("Recipient name is required."))
        }
        
        if self.phoneNumber == nil || self.phoneNumber == "" {
            errors.append(.PhoneNumberTextField("Phone number is required."))
        }
        
        if self.cityDistinct == nil || self.cityDistinct == "" {
            errors.append(.CityDistinctTextField("City/District/Postcode/Subdistrict is required"))
        }
        
        if self.houseStreet == nil || self.houseStreet == "" {
            errors.append(.HouseNoTextField("HouseNo.,Street name is required."))
        }
        
        self.delegate.onValidate(validationErrors: errors)
    }
    
    func save() {
        
    }
}


