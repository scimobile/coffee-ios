//
//  DeliveryAddressVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import UIKit

class DeliveryAddressVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblNav: UILabel!
    @IBOutlet weak var btnAddAddress: UIButton!
    @IBOutlet weak var tblDeliveryAddress: UITableView!
    
    private lazy var vm: DeliveryAddressVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
        self.vm.fetchAddress()
    }
    
    private func setUpViews() {
        [btnBack, btnAddAddress].tintColor(.primary)
        [lblNav, btnAddAddress].addFont(.popR15)
        [btnAddAddress].addBorder(color: .primary)
        btnAddAddress.setTitleColor(.primary, for: .normal)
        tblDeliveryAddress.dataSource = self
        tblDeliveryAddress.delegate = self
        tblDeliveryAddress.registerCell(DeliveryAddressCell.self)
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
        btnAddAddress.addTarget(self, action: #selector(onTapAddAddress), for: .touchUpInside)
    }
    
    @objc func onTapAddAddress() {
        let vc = AddAddressVC()
        //MARK: ToDo
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DeliveryAddressVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(DeliveryAddressCell.self, for: indexPath)
        //MARK: ToDo
        return cell
    }
}

extension DeliveryAddressVC: UITableViewDelegate {
    
}

extension DeliveryAddressVC: DeliveryAddressVMDelegate {
    func onLoadAddress() {
        self.tblDeliveryAddress.reloadData()
    }
}
