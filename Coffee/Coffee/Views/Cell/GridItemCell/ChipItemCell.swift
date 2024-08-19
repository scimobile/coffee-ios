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
            chipView.backgroundColor = isSelected ? AppColor.primary.color : AppColor.lightGray.color
            lblChip.textColor = isSelected ? AppColor.eggWhite.color : AppColor.darkBlue.color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chipView.backgroundColor = AppColor.lightGray.color
        chipView.layer.cornerRadius = 10
        
    }

}
