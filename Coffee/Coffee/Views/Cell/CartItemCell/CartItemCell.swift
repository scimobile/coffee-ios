//
//  CartItemCell.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/21/24.
//

import UIKit

class CartItemCell: UITableViewCell {

    @IBOutlet weak var imgCoffee: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblAddition: UILabel!
    @IBOutlet weak var btnAddQuantity: UIButton!
    @IBOutlet weak var btnMinusQuantity: UIButton!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectionStyle = .none
        setUpViews()
        setUpBindings()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setUpViews() {
        [lblTitle, lblPrice].addFont(.popSemiB16)
        lblAddition.font = .popR14
        lblAddition.textColor = .coffeeGray
        lblQuantity.font = .popR14
        [btnAddQuantity, btnMinusQuantity].tintColor(.primary)
    }
    
    private func setUpBindings() {
        btnDelete.addTarget(self, action: #selector(onTapDelete), for: .touchUpInside)
        btnAddQuantity.addTarget(self, action: #selector(onTapAdd), for: .touchUpInside)
        btnMinusQuantity.addTarget(self, action: #selector(onTapMinus), for: .touchUpInside)
    }
    
    @objc func onTapDelete() {
        //MARK: ToDo
    }
    
    @objc func onTapAdd() {
        //MARK: ToDo
    }
    
    @objc func onTapMinus() {
        //MARK: ToDo
    }
}
