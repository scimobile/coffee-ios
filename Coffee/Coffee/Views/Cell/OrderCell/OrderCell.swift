//
//  OrderCell.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-27.
//

import UIKit

class OrderCell: UITableViewCell {
    
    @IBOutlet weak var imgCoffee: UIImageView!
    @IBOutlet weak var imgOrderStatus: UIImageView!
    
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblOrderType: UILabel!
    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var lblOrderItemsCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        setupViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupViews() {
        lblOrderID.font = .popB14
        lblOrderType.font = .popM14
        lblOrderStatus.font = .popB20
        lblOrderItemsCount.font = .popM12
    }
    
}
