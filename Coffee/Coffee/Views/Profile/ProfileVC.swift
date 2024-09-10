//
//  ProfileVC.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

class ProfileVC: UIViewController, Storyboarded {
    static var storyboardName: String = "Home"
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder:NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = UITabBarItem(title: "Profile", image: .init(systemName: "person"), selectedImage: .init(systemName: "person.fill"))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @objc private func onTapBackButton() {
        navigationController?.popViewController(animated: true)
    }


}
