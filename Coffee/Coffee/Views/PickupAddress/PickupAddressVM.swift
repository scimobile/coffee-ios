//
//  PickupAddressVM.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import Foundation

protocol PickupAddressViewDelegate {
    func onLoadBranches()
}

class PickupAddressVM {
    private let delegate: PickupAddressViewDelegate
    
    init(delegate: PickupAddressViewDelegate) {
        self.delegate = delegate
    }
    
    private(set) var branches: [String] = [] {
        didSet {
            
        }
    }
    
    func fetchBranch() {
        self.branches = ["grerg", "geagr", "ge"]
        self.delegate.onLoadBranches()
    }
}
