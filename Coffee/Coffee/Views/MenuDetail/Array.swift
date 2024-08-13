//
//  Array.swift
//  Coffee
//
//  Created by Sithu Win on 11/08/2024.
//

import UIKit

extension Array where Element == UIButton{
    func addTarget(selector:Selector){
        self.forEach { button in
            button.addTarget(self, action: selector, for: .touchUpInside)
        }
    }
}


