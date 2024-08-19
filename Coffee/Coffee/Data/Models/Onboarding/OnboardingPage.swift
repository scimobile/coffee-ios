//
//  Onboarding.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/5/24.
//

import Foundation

struct OnboardingPage {
    let title: String
    let imageName: String
    let description: String
    
    static func getPages() -> [OnboardingPage]{
        return  [OnboardingPage(title: "Welcome To \nCaffeine Corner",
                                imageName: "welcome",
                                description: "Discover your favorite coffee, order with ease, and enjoy exclusive perks."),
                 OnboardingPage(title: "Earn Loyalty \nPoints",
                                imageName: "welcome2",
                                description: "Collect points with every purchase and redeem them for free coffee and exclusive rewards."),
                 OnboardingPage(title: "Easy Ordering \n",
                                imageName: "welcome3",
                                description: "Order your favorite coffee in just a few taps and pick it up at your convenience.")
                 ]
    }
    
}
