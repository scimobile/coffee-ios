//
//  MenuDetailVM.swift
//  Coffee
//
//  Created by Sithu Win on 26/08/2024.
//

import Foundation

protocol MenuDetailDelegate{
    func onGetMenuDetail()
}

class MenuDetailVM{
    
    var detail:MenuDetail? = nil{
        didSet{
            if detail != nil{
                delegate.onGetMenuDetail()
            }
        }
    }
    
    private let delegate:MenuDetailDelegate
    
    init(delegate: MenuDetailDelegate) {
        self.delegate = delegate
    }
    
    public func onChangeFav(){
        detail?.boolFav.toggle()
    }
    // TODO Get Data from API
    
    
}
