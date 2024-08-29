//
//  FavoritesVM.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-22.
//

import Foundation

protocol FavoritesViewDelegate {
    func onLoadFavoriteMenus()
}

class FavoritesVM {
    
    private let delegate: FavoritesViewDelegate
    
    init(delegate: FavoritesViewDelegate) {
        self.delegate = delegate
    }
    
    func fetchFavoriteMenus() {
        
    }
}
