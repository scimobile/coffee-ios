//
//  PaymentVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import Foundation

protocol PaymentVMDelegate {
    func onLoadPayments()
}

class PaymentVM {
    private let delegate: PaymentVMDelegate
    
    init(delegate: PaymentVMDelegate) {
        self.delegate = delegate
    }
    
    private(set) var payments: [String] = ["Cash"] {
        didSet {
            self.delegate.onLoadPayments()
        }
    }
    
    func fetchPayments() {
        self.payments = ["Cash", "Aya", "UAB", "CB"]
        //MARK: ToDo
    }
}
