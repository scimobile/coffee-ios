//
//  OrderConfirmVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/23/24.
//

import UIKit

class OrderConfirmVC: UIViewController, Storyboarded {

    @IBOutlet weak var imgSuccess: UIImageView!
    @IBOutlet weak var lblThankyou: UILabel!
    @IBOutlet weak var lblOrder: UILabel!
    @IBOutlet weak var lblCongratulation: UILabel!
    
    static var storyboardName: String = "Cart"
    
    private lazy var vm: OrderConfirmVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
    }
    
    private func setUpViews() {
        lblThankyou.font = .popR25
        imgSuccess.tintColor = .primary
        lblThankyou.tintColor = .primary
        [lblOrder, lblCongratulation].addFont(.popR15)
    }
    
    private func setUpBindings() {
        lblOrder.text = "Your order \(self.vm.orderId ?? "") has been placed."
        lblOrder.setColoredString(fullString: lblOrder.text ?? "", .primary, self.vm.orderId ?? "")
        lblCongratulation.text = "Congratulation! You have also earn \(self.vm.coins ?? 0) coins."
        lblCongratulation.setColoredString(fullString: lblCongratulation.text ?? "", .primary, "\(self.vm.coins ?? 0) coins")
    }

}

extension OrderConfirmVC: OrderConfirmVMDelegate {
    
}
