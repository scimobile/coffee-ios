//
//  RootNC.swift
//  Coffee
//
//  Created by Sithu Win on 06/08/2024.
//

import UIKit

class RootNC: UINavigationController {
    
    @UserLoginStatus private var isUserLogin: Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
            //Strong Reference => Weak Ref
            //Memory Leak
            self?.checkOnboardingState()
        }
    }
    
    private func checkOnboardingState() {
        if UserDefaults.standard.bool(forKey: UserDefaultsKeys.hasUsedAppBefore){
            checkLoginStatus()
        } else {
            // OnboardingVC is root of RootNC
            let vc = OnboardingVC.instantiate()
            pushViewController(vc, animated: true)
        }
    }
    
    private func checkLoginStatus() {
        if isUserLogin {
            // Go To Home
           goToHome()
        } else {
            goToLogin()
        }
    }
    
    func goToHome() {
        // TBD
        let vc = TabVC.instantiate()
        setViewControllers([vc], animated: true)
    }
    
    func goToLogin() {
        let vc = LoginVC.instantiate()
        pushViewController(vc, animated: true)
    }
    
}


extension UIViewController {
    var rootNC:RootNC? {
        navigationController as? RootNC
    }
}
