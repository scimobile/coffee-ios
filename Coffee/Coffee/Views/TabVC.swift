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
            size.height = 90
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
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        object_setClass(self.tabBar, CustomHeightTabbar.self)
        
        setupNC()
        setupTabBarAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupNC() {
        let homeNavController = UINavigationController(rootViewController: homeVC)
        let favoriteNavController = UINavigationController(rootViewController: favoriteVC)
        let orderNavController = UINavigationController(rootViewController: orderVC)
        let profileNavController = UINavigationController(rootViewController: profileVC)
        
        viewControllers = [
            homeNavController,
            favoriteNavController,
            orderNavController,
            profileNavController
        ]
    }
    
    private func setupTabBarAppearance() {
        
        tabBar.tintColor = .eggWhite
        tabBar.unselectedItemTintColor = .coffeeGray
        tabBar.backgroundColor = .eggWhite
        
        tabBar.layer.shadowColor = UIColor.secondary.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
        
        let normalAttribute = [NSAttributedString.Key.foregroundColor: UIColor.coffeeGray]
        let selectedAttribute = [NSAttributedString.Key.foregroundColor: UIColor.secondary]
        
        tabBar.items?.forEach {
            $0.setTitleTextAttributes(normalAttribute, for: .normal)
            $0.setTitleTextAttributes(selectedAttribute, for: .selected)
        }
        
        if let items = tabBar.items {
            for item in items {
                if let image = item.image {
                    item.selectedImage = image.withTintColor(.secondary, renderingMode: .alwaysOriginal)
                }
            }
        }
    }
    
}
