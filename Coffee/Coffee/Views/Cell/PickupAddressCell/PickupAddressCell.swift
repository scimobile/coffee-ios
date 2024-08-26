//
//  PickupAddressCell.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import UIKit

class PickupAddressCell: UITableViewCell {

    @IBOutlet weak var imgPinPoint: UIImageView!
    @IBOutlet weak var lblBranchName: UILabel!
    @IBOutlet weak var lblBranchAddress: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpViews()
        setUpBindings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        viewCell.backgroundColor = selected ? .primary : .white
        imgPinPoint.tintColor = selected ? .white : .primary
        lblBranchName.textColor = selected ? .white : .black
        lblBranchAddress.textColor = selected ? .white : .black
    }
    
    private func setUpViews() {
        self.selectionStyle = .none
        imgPinPoint.tintColor = .primary
        lblBranchName.font = .popSemiB15
        lblBranchAddress.font = .popR15
        viewCell.addShadow(opacity: 0.1)
    }
    
    private func setUpBindings() {
        
    }
}
