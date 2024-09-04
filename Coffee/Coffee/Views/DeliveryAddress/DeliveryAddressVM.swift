//
//  DeliveryAddressVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import Foundation

protocol DeliveryAddressVMDelegate {
    func onLoadAddress()
}

class DeliveryAddressVM {
    private let delegate: DeliveryAddressVMDelegate
    
    init(delegate: DeliveryAddressVMDelegate) {
        self.delegate = delegate
    }
    
    private(set) var addresses: [String] = [] {
        didSet {
            self.delegate.onLoadAddress()
        }
    }
    
    func fetchAddress() {
        //MARK: ToDo
        self.addresses = ["grew", "wwrg", "fgwggwr"]
    }
}
