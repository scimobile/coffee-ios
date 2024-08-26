//
//  PickupAddressVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import UIKit

class PickupAddressVC: UIViewController, Storyboarded {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblNav: UILabel!
    @IBOutlet weak var tblBranches: UITableView!
    
    static var storyboardName: String = "Cart"
    
    private lazy var vm: PickupAddressVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
        self.vm.fetchBranch()
    }
    
    private func setUpViews() {
        btnBack.tintColor = .primary
        [lblNav].addFont(.popR15)
        tblBranches.dataSource = self
        tblBranches.delegate = self
        tblBranches.separatorStyle = .none
        tblBranches.registerCell(PickupAddressCell.self)
        tblBranches.contentInset = .init(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
    }

    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PickupAddressVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.branches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(PickupAddressCell.self, for: indexPath)
        //MARK: ToDo
        return cell
    }
}

extension PickupAddressVC: UITableViewDelegate {
    
}

extension PickupAddressVC: PickupAddressViewDelegate {
    func onLoadBranches() {
        //MARK: ToDo
        self.tblBranches.reloadData()
        tblBranches.selectRow(at: .init(row: 0, section: 0), animated: true, scrollPosition: .none)
    }
}
