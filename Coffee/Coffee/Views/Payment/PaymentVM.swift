//
//  PaymentVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import Foundation

protocol PaymentViewDelegate {
    func onLoadPayments()
}

class PaymentVM {
    private let delegate: PaymentViewDelegate
    
    init(delegate: PaymentViewDelegate) {
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
