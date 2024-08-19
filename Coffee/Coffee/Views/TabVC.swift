//
//  TabVC.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

class TabVC: UITabBarController {
    
    class CustomTabBar: UITabBar {
        private let customHeight: CGFloat = 100
        
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            var sizeThatFits = super.sizeThatFits(size)
            sizeThatFits.height = customHeight
            return sizeThatFits
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCustomTabBar()
        self.setupTabs()
        self.setupTabBarAppearance()
    }
    
    private func setupCustomTabBar() {
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKey: "tabBar")
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
        
        homeVC.tabBarItem.setTitleTextAttributes([.foregroundColor: AppColor.secondary.color], for: .selected)
        homeVC.tabBarItem.setTitleTextAttributes([.foregroundColor: AppColor.lightGray.color], for: .normal)
        
        favoriteVC.tabBarItem.setTitleTextAttributes([.foregroundColor: AppColor.secondary.color], for: .selected)
        favoriteVC.tabBarItem.setTitleTextAttributes([.foregroundColor: AppColor.lightGray.color], for: .normal)
        
        orderVC.tabBarItem.setTitleTextAttributes([.foregroundColor: AppColor.secondary.color], for: .selected)
        orderVC.tabBarItem.setTitleTextAttributes([.foregroundColor: AppColor.lightGray.color], for: .normal)
        
        profileVC.tabBarItem.setTitleTextAttributes([.foregroundColor: AppColor.secondary.color], for: .selected)
        profileVC.tabBarItem.setTitleTextAttributes([.foregroundColor: AppColor.lightGray.color], for: .normal)
    }
    
    private func setupTabBarAppearance() {
        
        tabBar.tintColor = AppColor.eggWhite.color
        tabBar.unselectedItemTintColor = AppColor.lightGray.color
        tabBar.backgroundColor = AppColor.eggWhite.color
        
        tabBar.layer.shadowColor = AppColor.secondary.color.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        tabBar.layer.shadowOpacity = 0.3
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
        
        if let items = tabBar.items {
            for item in items {
                if let image = item.image {
                    item.selectedImage = image.withTintColor(AppColor.secondary.color, renderingMode: .alwaysOriginal)
                }
            }
        }
    }
    
}
