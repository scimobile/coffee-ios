//
//  DeliveryAddressCell.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import UIKit

class DeliveryAddressCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var imgPinPoint: UIImageView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var viewDefaultAddress: UIView!
    @IBOutlet weak var lblDefaultAddress: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpViews()
        setUpBindings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUpViews() {
        self.selectionStyle = .none
        [lblName].addFont(.popSemiB16)
        [lblAddress, lblPhoneNumber].addFont(.popR15)
        [btnEdit].addFont(.popR14)
        [lblDefaultAddress].addFont(.popR13)
        imgPinPoint.tintColor = .primary
        [viewDefaultAddress].addBorder(width: 1, color: .red)
    }
    
    private func setUpBindings() {
        btnEdit.addTarget(self, action: #selector(onTapEdit), for: .touchUpInside)
    }
    
    @objc func onTapEdit() {
        //MARK: ToDo
    }
}
