//
//  OrderItemCell.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-29.
//

import UIKit

class OrderItemCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupViews() {
        
    }
    
}
