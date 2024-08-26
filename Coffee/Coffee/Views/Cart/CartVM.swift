//
//  CartVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/21/24.
//

import Foundation

protocol CartViewDelegate {
    func onChangeDeliveryPickup()
    func onLoadCart()
}

class CartVM {
    private let delegate: CartViewDelegate
    
    private(set) var isDelivery: Bool = true {
        didSet {
            self.delegate.onChangeDeliveryPickup()
        }
    }
    
    private(set) var items: [String] = [] {
        didSet {
            self.delegate.onLoadCart()
        }
    }
    
    init(delegate: CartViewDelegate) {
        self.delegate = delegate
    }
    
    func setIsDelivery(isDelivery: Bool) {
        self.isDelivery = isDelivery
    }
    
    func fetchCart() {
        // MARK: ToDo
        //Testing with sample data
        self.items = ["wg", "gwrg", "wrrgw"]
    }
    
    func checkout() {
        //MARK: ToDo
    }
}
