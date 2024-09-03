//
//  TabVC.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

class TabVC: UITabBarController, Storyboarded {
    
    static var storyboardName: String = "Home"
    
    class CustomHeightTabbar:UITabBar{
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            var size = super.sizeThatFits(size)
            size.height = 100
            return size
        }
    }
    
    var homeVC:HomeVC {
        let vc = HomeVC.instantiate()
        return vc
    }
    
    var favoriteVC:FavoriteVC {
        let vc = FavoriteVC.instantiate()
        return vc
    }
    
    var profileVC:ProfileVC {
        let vc = ProfileVC.instantiate()
        return vc
    }
    
    var orderVC:OrderVC {
        let vc = OrderVC.instantiate()
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            homeVC,
            favoriteVC,
            profileVC,
            orderVC
        ]
        
        object_setClass(self.tabBar, CustomHeightTabbar.self)
        self.setupTabBarAppearance()
    }
    
    private func setupTabBarAppearance() {
        
        tabBar.tintColor = .eggWhite
        tabBar.unselectedItemTintColor = .coffeeGray
        tabBar.backgroundColor = .eggWhite
        
        tabBar.layer.shadowColor = UIColor.secondary.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
        
        if let items = tabBar.items {
            for item in items {
                if let image = item.image {
                    item.selectedImage = image.withTintColor(.secondary, renderingMode: .alwaysOriginal)
                }
            }
        }
    }
    
}
