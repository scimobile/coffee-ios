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
    
    private lazy var vm:OnboardingVM = .init(delegate: self)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
    }
    
    private func setupView(){
        //Collection View Binding
        cvOnboarding.register(.init(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCell")
        cvOnboarding.dataSource = self
        cvOnboarding.delegate = self
        cvOnboarding.isPagingEnabled = true
        
        //Fetch Data from ViewModel
        vm.fetchData()
        
        pageControl.numberOfPages = vm.onboardingData.count
        
        btnNext.titleLabel?.font = AppFont.poppinsRegular.of(size: 12)
    }
    
    private func setupBindings(){
        btnNext.addTarget(self, action: #selector(btnNextTapped), for: .touchUpInside)
    }
    
    @objc func btnNextTapped() {
        let currentIndex = pageControl.currentPage
        if currentIndex < vm.onboardingData.count - 1 {
            let nextIdex = IndexPath(item: currentIndex + 1, section: 0)
            cvOnboarding.scrollToItem(at: nextIdex, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = nextIdex.item
        } else {
            UserDefaults.standard.set(true, forKey: UserDefaultsKeys.hasUsedAppBefore)
            /// TODO : GO TO LOGIN
            print("Go to Login")
        }
        updateBtnTitle()
    }
    
    private func updateBtnTitle() {
        if pageControl.currentPage == vm.onboardingData.count - 1{
            btnNext.setTitle("Get Started", for: .normal)
        } else {
            btnNext.setTitle("Next", for: .normal)
        }
    }
  
}

//UICollectionViewDataSource
extension OnboardingVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.onboardingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell
        guard let cell = cell else { return UICollectionViewCell() }
        cell.setup(onboardingItem: vm.onboardingData[indexPath.row])
        return cell
    }
}

//UICollectionViewDelegateFlowLayout
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

//OnboardingDelegate
extension OnboardingVC: OnboardingDelegate{
    func getOnboardingPages() {
        cvOnboarding.reloadData()
    }
}
