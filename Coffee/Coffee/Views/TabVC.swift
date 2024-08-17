//
//  TabVC.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

class TabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }

    private func setupTabs() {
        guard let viewControllers = self.viewControllers else { return }
        
        let homeVC = viewControllers[0]
        let favoriteVC = viewControllers[1]
        let orderVC = viewControllers[2]
        let profileVC = viewControllers[3]
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        favoriteVC.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star"), tag: 1)
        orderVC.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "list.bullet.clipboard"), tag: 2)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 3)
    }
    
}
