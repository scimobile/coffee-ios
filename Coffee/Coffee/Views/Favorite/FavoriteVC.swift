//
//  FavoriteVC.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

class FavoriteVC: UIViewController, Storyboarded {
    static var storyboardName: String = "Home"
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder:NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = UITabBarItem(title: "Favorite", image: .init(systemName: "star"), selectedImage: .init(systemName: "star.fill"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
    }
    

}
