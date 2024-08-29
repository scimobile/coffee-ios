//
//  PaymentVC.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/22/24.
//

import UIKit

class PaymentVC: UIViewController, Storyboarded {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblNav: UILabel!
    @IBOutlet weak var tblPayments: UITableView!
    @IBOutlet weak var lblAddMethods: UILabel!
    @IBOutlet weak var lblCards: UILabel!
    @IBOutlet weak var heightTblPayments: NSLayoutConstraint!
    
    static var storyboardName: String = "Cart"
    
    private lazy var vm: PaymentVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBindings()
        self.vm.fetchPayments()
    }

    private func setUpViews() {
        btnBack.tintColor = .primary
        lblNav.font = .popR15
        lblAddMethods.font = .popR15
        lblCards.font = .popR15
        tblPayments.dataSource = self
        tblPayments.delegate = self
        tblPayments.separatorStyle = .none
        tblPayments.registerCell(PaymentCell.self)
        tblPayments.contentInset = .init(top: 20, left: 0, bottom: 0, right: 0)
        tblPayments.estimatedRowHeight = 51
        tblPayments.rowHeight = UITableView.automaticDimension
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
    }
    
    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateTableViewHeight() {
        self.tblPayments.reloadData()
        self.tblPayments.layoutIfNeeded()
        self.heightTblPayments.constant = self.tblPayments.contentSize.height + 20
    }
}

extension PaymentVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.payments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(PaymentCell.self, for: indexPath)
        //MARK: ToDo
        cell.index = indexPath.row
        return cell
    }
}

extension PaymentVC: UITableViewDelegate {
    
}

extension PaymentVC: PaymentVMDelegate {
    func onLoadPayments() {
        self.updateTableViewHeight()
        self.tblPayments.selectRow(
            at: .init(row: 0, section: 0),
            animated: true,
            scrollPosition: .none
        )
    }
}
