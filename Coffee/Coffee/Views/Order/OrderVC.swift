//
//  OrderVC.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

class OrderVC: UIViewController, Storyboarded {
    static var storyboardName: String = "Home"
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder:NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = UITabBarItem(title: "Order", image: .init(systemName: "list.bullet.circle"), selectedImage: .init(systemName: "list.bullet.circle.fill"))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBlue
    }
    

}
