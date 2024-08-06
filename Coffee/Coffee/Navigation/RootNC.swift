//
//  RootNC.swift
//  Coffee
//
//  Created by Sithu Win on 06/08/2024.
//

import UIKit

class RootNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
}


extension UIViewController {
    var rootNC:RootNC? {
        navigationController as? RootNC
    }
}
