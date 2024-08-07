//
//  OnboardingCell.swift
//  Coffee
//
//  Created by Sithu Win on 07/08/2024.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var desLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        title.font = UIFont(name: "Poppins-Bold", size: 24)
        desLabel.font = UIFont(name: "Poppins-Regular", size: 16)
        ivImage.contentMode = .scaleAspectFit
    }

}
