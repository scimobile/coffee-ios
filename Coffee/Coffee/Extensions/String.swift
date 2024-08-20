//
//  String.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/5/24.
//

import Foundation
import RegexBuilder

extension String? {
    var isEmail: Bool {
        guard let email = self,
              !email.isEmpty,
              email.wholeMatch(of: emailRegex) != nil
        else { return false }
        return true
    }
    
    var isValidPassword: Bool {
        guard let password = self,
              !password.isEmpty,
              password.wholeMatch(of: passwordRegex) != nil
        else { return false }
        return true
    }
}
