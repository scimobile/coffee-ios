//
//  FavoriteCell.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-22.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var imgCoffee: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewCard: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    
    private func setupViews() {
        imgCoffee.layer.cornerRadius = 20
        
        lblName.font = .popM14
        lblPrice.font = .monospacedDigitSystemFont(ofSize: 14, weight: .regular)
        
        viewCard.layer.cornerRadius = 15
        viewCard.dropShadow()
    }
}
