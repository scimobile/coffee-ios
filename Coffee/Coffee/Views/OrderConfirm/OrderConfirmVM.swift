//
//  OrderConfirmVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/23/24.
//

import Foundation

protocol OrderConfirmVMDelegate {
    
}

class OrderConfirmVM {
    private let delegate: OrderConfirmVMDelegate
    
    init(delegate: OrderConfirmVMDelegate) {
        self.delegate = delegate
    }
    
    private(set) var orderId: String? = "#01230SD23"
    
    private(set) var coins: Int? = 134
}
