//
//  OnboardingVC.swift
//  Coffee
//
//  Created by Sithu Win on 05/08/2024.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var cvOnboarding:UICollectionView!
    @IBOutlet weak var pageControl:UIPageControl!
    @IBOutlet weak var btnNext:UIButton!
    
    let pages: [OnboardingPage] = [OnboardingPage(title: "Welcome To \nCaffeine Corner", imageName: "welcome", description: "Discover your favorite coffee, order with ease, and enjoy exclusive perks."),
                                   OnboardingPage(title: "Earn Loyalty \nPoints", imageName: "welcome2", description: "Collect points with every purchase and redeem them for free coffee and exclusive rewards."),
                                   OnboardingPage(title: "Easy Ordering \n", imageName: "welcome3", description: "Order your favorite coffee in just a few taps and pick it up at your convenience.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("cvOnboarding frame: \(cvOnboarding.frame)")
        cvOnboarding.register(.init(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCell")
        cvOnboarding.dataSource = self
        cvOnboarding.delegate = self
        cvOnboarding.isPagingEnabled = true
       
        pageControl.numberOfPages = pages.count
        
        btnNext.addTarget(self, action: #selector(btnNextTapped), for: .touchUpInside)
        
        btnNext.titleLabel?.font = UIFont(name: "Poppins-Regular", size: 12)
        
    }
    
    @objc func btnNextTapped() {
        let currentIndex = pageControl.currentPage
        if currentIndex < pages.count - 1 {
            let nextIdex = IndexPath(item: currentIndex + 1, section: 0)
            cvOnboarding.scrollToItem(at: nextIdex, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = nextIdex.item
        } else {
            UserDefaults.standard.set(true, forKey: "hasUsedAppBefore")
            /// TODO : GO TO LOGIN
            print("Go to Login")
        }
        
        updateBtnTitle()
    }
    
    private func updateBtnTitle() {
        if pageControl.currentPage == pages.count - 1{
            btnNext.setTitle("Get Started", for: .normal)
        } else {
            btnNext.setTitle("Next", for: .normal)
        }
    }
  

}

extension OnboardingVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell
        guard let cell = cell else { return UICollectionViewCell() }
        
        let currentPage = pages[indexPath.item]
        cell.title.text = currentPage.title
        cell.ivImage.image = UIImage(named: currentPage.imageName)
        cell.desLabel.text = currentPage.description
        
        return cell
    }
    
    
}

extension OnboardingVC: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: cvOnboarding.bounds.width, height: cvOnboarding.bounds.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        updateBtnTitle()
    }
}
