//
//  OrdersHistoryDetailVM.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-27.
//

import Foundation

protocol OrdersHistoryDetailViewDelegate {
    func onLoadOrderDetail()
}

class OrdersHistoryDetailVM {

    private let delegate: OrdersHistoryViewDelegate
    
    init(delegate: OrdersHistoryViewDelegate) {
        self.delegate = delegate
    }
}
