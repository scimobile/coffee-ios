//
//  OrdersHistoryDetailVC.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-27.
//

import UIKit

class OrdersHistoryDetailVC: UIViewController, Storyboarded {

    static var storyboardName: String = "Orders"
    
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var deliveryView: UIView!
    @IBOutlet weak var orderInfoView: UIView!
    @IBOutlet weak var orderAddressBgView: UIView!
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var imgLocationIcon: UIImageView!
    @IBOutlet weak var imgPayment: UIImageView!
    
    // MARK - Title Labels
    @IBOutlet weak var lblSubtotalTitle: UILabel!
    @IBOutlet weak var lblDeliveryFeesTitle: UILabel!
    @IBOutlet weak var lblServiceTaxTitle: UILabel!
    @IBOutlet weak var lblDiscountPriceTitle: UILabel!
    @IBOutlet weak var lblTotalTitle: UILabel!
    @IBOutlet weak var lblPayWithTitle: UILabel!
    
    // MARK - Values Labels
    @IBOutlet weak var lblOrderID: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var lblLocationStatus: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var lblDeliveryFees: UILabel!
    @IBOutlet weak var lblServiceTax: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblPaymentType: UILabel!
    @IBOutlet weak var lblPaymentTypeAmount: UILabel!
    
    @IBOutlet weak var tbOrderItems: UITableView!
    @IBOutlet weak var heightTblOrderItems: NSLayoutConstraint!
    
    private lazy var vm = OrdersHistoryDetailVM(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
    }

    private func setupViews() {
        setupFont()
        [btnBack, imgLocationIcon, imgPayment].tintColor(.primary)
//        [orderInfoView, orderAddressBgView].backgroundColor(.coffeeGray)
        orderInfoView.backgroundColor = .coffeeGray.withAlphaComponent(0.2)
        
        tbOrderItems.registerCell(OrderItemCell.self)
        tbOrderItems.dataSource = self
        tbOrderItems.delegate = self
        tbOrderItems.rowHeight = UITableView.automaticDimension
        tbOrderItems.separatorStyle = .none
        tbOrderItems.contentInset = .zero
        updateTableViewHeight()
        
        
        func setupFont() {
            [
                lblOrderDate,
                lblSubtotalTitle,
                lblDeliveryFeesTitle,
                lblServiceTaxTitle,
                lblDiscountPriceTitle,
                lblLocationStatus,
                lblAddress,
                lblSubtotal,
                lblDeliveryFees,
                lblServiceTax,
                lblDiscountPrice,
                lblPaymentType,
                lblPaymentTypeAmount
            ].addFont(.popR15)
            
            [
                lblOrderID,
                lblTotalTitle,
                lblTotalPrice,
                lblPayWithTitle
            ].addFont(.popB20)
        }
    }
    
    private func setupBindings() {
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
    }
    
    @objc func onTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
    private func updateTableViewHeight() {
        self.tbOrderItems.reloadData()
        self.tbOrderItems.layoutIfNeeded()
        self.heightTblOrderItems.constant = self.tbOrderItems.contentSize.height
    }
}

extension OrdersHistoryDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(OrderItemCell.self, for: indexPath)
        // TODO - Pass Data to the cell here
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Going to Item Detail with index at: \(indexPath.row)")
    }
    
}

extension OrdersHistoryDetailVC: OrdersHistoryViewDelegate {
    func onLoadOrdersHistory() {
        updateTableViewHeight()
    }
}
