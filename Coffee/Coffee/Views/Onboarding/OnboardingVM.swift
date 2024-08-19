//
//  OnboardingVM.swift
//  Coffee
//
//  Created by Sithu Win on 10/08/2024.
//

import Foundation

protocol OnboardingDelegate{
    func getOnboardingPages()
}

class OnboardingVM{
    
    private (set) var onboardingData:[OnboardingPage] = []{
        didSet{
            delegate.getOnboardingPages()
        }
    }
    
    private let delegate:OnboardingDelegate
    
    init(delegate: OnboardingDelegate) {
        self.delegate = delegate
    }
    
    func fetchData(){
        self.onboardingData = OnboardingPage.getPages()
    }
}
