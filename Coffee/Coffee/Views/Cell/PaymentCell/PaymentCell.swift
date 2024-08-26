//
//  PaymentCell.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/23/24.
//

import UIKit

class PaymentCell: UITableViewCell {

    @IBOutlet weak var imgPayment: UIImageView!
    @IBOutlet weak var lblPayment: UILabel!
    @IBOutlet weak var imgSelect: UIImageView!
    
    var index: Int? {
        didSet {
            if let index = index {
                self.imgPayment.image = UIImage(systemName: index > 0 ? "creditcard" : "banknote")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpViews()
        setUpBindings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.imgSelect.image = UIImage(systemName: selected ? "circle.circle.fill" : "circle")
    }
    
    private func setUpViews() {
        lblPayment.font = .popR15
        self.imgSelect.tintColor = .primary
        selectionStyle = .none
    }
    
    private func setUpBindings() {
        
    }
}
