//
//  OrdersHistoryVM.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-27.
//

import Foundation

protocol OrdersHistoryViewDelegate {
    func onLoadOrdersHistory()
}

class OrdersHistoryVM {
    
    private let delegate: OrdersHistoryViewDelegate
    
    init(delegate: OrdersHistoryViewDelegate) {
        self.delegate = delegate
    }
    
    func fetchOrdersHistory() {
        
    }
}
