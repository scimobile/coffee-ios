//
//  FavoritesVC.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-22.
//

import UIKit

class FavoritesVC: UIViewController, Storyboarded {
    
    static var storyboardName: String = "Favorites"
    
    @IBOutlet weak var cvFavorites: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    private lazy var vm = FavoritesVM(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vm.fetchFavoriteMenus()
    }
    
    private func setupViews() {
        cvFavorites.registerCell(FavoriteCell.self)
        cvFavorites.delegate = self
        cvFavorites.dataSource = self
        cvFavorites.contentInset = .init(top: 20, left: 10, bottom: 20, right: 10)
        
        lblTitle.font = .popB24
    }
    
    private func setupBindings() {
        
    }

}

extension FavoritesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(FavoriteCell.self, for: indexPath)
        // TODO - Pass Data to the cell here
        return cell
    }
    
    // TODO - Go To Menu Detail Here
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Go to menu detail here with index at: \(indexPath.row)")
    }
    
}

extension FavoritesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (collectionView.frame.width - 30)/2, height: 230)
    }
}

extension FavoritesVC: FavoritesViewDelegate {
    func onGetFavoriteMenus() {
        cvFavorites.reloadData()
    }
}
