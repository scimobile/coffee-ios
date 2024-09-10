//
//  CartVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/21/24.
//

import UIKit

class CartVC: UIViewController, Storyboarded {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblNav: UILabel!
    @IBOutlet weak var sgcDeliveryPickup: UISegmentedControl!
    @IBOutlet weak var tblCartItems: UITableView!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblSubTotalPrice: UILabel!
    @IBOutlet weak var viewDeliveryFee: UIView!
    @IBOutlet weak var lblDeliveryFees: UILabel!
    @IBOutlet weak var lblDeliveryFeesPrice: UILabel!
    @IBOutlet weak var lblServiceTax: UILabel!
    @IBOutlet weak var lblServiceTaxPrice: UILabel!
    @IBOutlet weak var viewRedeem: UIView!
    @IBOutlet weak var lblRedeem: UILabel!
    @IBOutlet weak var lblRedeemPrice: UILabel!
    @IBOutlet weak var switchRedeem: UISwitch!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var lblDeliveryView: UILabel!
    @IBOutlet weak var lblDeliveryAddress: UILabel!
    @IBOutlet weak var lblPickupView: UILabel!
    @IBOutlet weak var imgPinPointDelivery: UIImageView!
    @IBOutlet weak var imgPinPointPickup: UIImageView!
    @IBOutlet weak var imgCash: UIImageView!
    @IBOutlet weak var imgChevLeftDelivery: UIImageView!
    @IBOutlet weak var imgChevLeftPickup: UIImageView!
    @IBOutlet weak var imgChevLeftCash: UIImageView!
    @IBOutlet weak var lblPickupAddress: UILabel!
    @IBOutlet weak var lblPaymentView: UILabel!
    @IBOutlet weak var lblPaymentMethod: UILabel!
    @IBOutlet weak var viewCheckout: UIView!
    @IBOutlet weak var btnCheckout: UIButton!
    @IBOutlet weak var viewPrice: UIView!
    @IBOutlet weak var viewAddress: UIView!
    @IBOutlet weak var viewDeliveryAddress: UIView!
    @IBOutlet weak var viewPickupAddress: UIView!
    @IBOutlet weak var heightTblCartItems: NSLayoutConstraint!
    
    static var storyboardName: String = "Card"
    
    private lazy var vm: CartVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
        self.vm.fetchCart()
    }

    private func setUpViews() {
        setUpFont()
        btnCheckout.tintColor = .primary
        switchRedeem.onTintColor = .primary
        [
            imgPinPointDelivery,
            imgPinPointPickup,
            imgCash,
            imgChevLeftDelivery,
            imgChevLeftPickup,
            imgChevLeftCash
        ].tintColor(.primary)
        viewCheckout.addShadow(opacity: 0.3)
        [viewPrice, viewAddress].addShadow(opacity: 0.1)
        tblCartItems.dataSource = self
        tblCartItems.delegate = self
        tblCartItems.estimatedRowHeight = 110
        tblCartItems.rowHeight = UITableView.automaticDimension
        tblCartItems.separatorStyle = .none
        tblCartItems.registerCell(CartItemCell.self)
    }
    
    private func setUpFont() {
        [
            btnBack,
            lblDeliveryAddress,
            lblPickupAddress,
            lblPaymentMethod
        ].addFont(.popSemiB15)
        let sgcFont: UIFont = .popR14
        sgcDeliveryPickup.setTitleTextAttributes(
            [.font: sgcFont],
            for: .normal
        )
        sgcDeliveryPickup.setTitleTextAttributes(
            [.foregroundColor: UIColor.white],
            for: .selected
        )
        sgcDeliveryPickup.selectedSegmentTintColor =  .primary
        [
            lblNav,
            lblSubTotal,
            lblSubTotalPrice,
            lblDeliveryFees,
            lblDeliveryFeesPrice,
            lblServiceTax,
            lblServiceTaxPrice,
            lblRedeem,
            lblRedeemPrice,
            lblDeliveryView,
            lblPickupView,
            lblPaymentView
        ].addFont(.popR15)
        [btnCheckout].addFont(.popR14)
    }
    
    private func setUpBindings() {
        sgcDeliveryPickup.addTarget(self, action: #selector(onChangeDeliveryPickUp), for: .valueChanged)
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
    }
    
    @objc func onChangeDeliveryPickUp() {
        self.vm.setIsDelivery(isDelivery: sgcDeliveryPickup.selectedSegmentIndex == 0)
    }
    
    @objc func onTapCheckout() {
        self.vm.checkout()
    }
    
    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateTableViewHeight() {
        self.tblCartItems.reloadData()
        self.tblCartItems.layoutIfNeeded()
        self.heightTblCartItems.constant = self.tblCartItems.contentSize.height + 20.0
    }
}

extension CartVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(CartItemCell.self, for: indexPath)
        //MARK: ToDo
        return cell
    }
}

extension CartVC: UITableViewDelegate {
    
}

extension CartVC: CartVMDelegate {
    func onChangeDeliveryPickup() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            
            if self.vm.isDelivery {
                [
                    self.viewDeliveryFee,
                    self.viewDeliveryAddress
                ].isHidden(false)
                self.viewPickupAddress.isHidden = true
            }
            else {
                [
                    self.viewDeliveryFee,
                    self.viewDeliveryAddress
                ].isHidden(true)
                self.viewPickupAddress.isHidden = false
            }
        }

    }
    
    func onLoadCart() {
        //MARK: ToDo
        self.updateTableViewHeight()
    }
}
