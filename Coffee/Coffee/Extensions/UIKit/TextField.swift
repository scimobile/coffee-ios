//
//  TextField.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/14/24.
//

import Foundation
import UIKit

extension Array where Element == UITextField? {
    func addTarget(for vc: UIViewController, action: Selector) {
        self.compactMap {
            $0
        }.forEach {
            $0.addTarget(vc, action: action, for: .editingChanged)
        }
        
    }
}
