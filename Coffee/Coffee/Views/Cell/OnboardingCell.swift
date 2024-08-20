//
//  OnboardingCell.swift
//  Coffee
//
//  Created by Sithu Win on 07/08/2024.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var lblDes: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.font = .popB24
        lblDes.font = .popR16
        iconImage.contentMode = .scaleAspectFit
    }

    func setup(onboardingItem:OnboardingPage) {
        lblTitle.text = onboardingItem.title
        iconImage.image = UIImage(named: onboardingItem.imageName)
        lblDes.text = onboardingItem.description
    }
    
}
