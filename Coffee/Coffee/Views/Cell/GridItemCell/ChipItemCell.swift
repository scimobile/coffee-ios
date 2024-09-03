//
//  ChipItemCell.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/19/24.
//

import UIKit

class ChipItemCell: UICollectionViewCell {
    
    @IBOutlet weak var chipView: UIView!
    @IBOutlet weak var lblChip: UILabel!
    
    override var isSelected: Bool {
        didSet {
            chipView.backgroundColor = isSelected ? .primary : .coffeeGray
            lblChip.textColor = isSelected ? .eggWhite : .darkBlue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chipView.backgroundColor = .coffeeGray
        chipView.layer.cornerRadius = 10
        
    }

}
