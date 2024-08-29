//
//  OrdersHistoryVC.swift
//  Coffee
//
//  Created by Nanda WK on 2024-08-27.
//

import UIKit

class OrdersHistoryVC: UIViewController, Storyboarded {
    
    static var storyboardName: String = "Orders"
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tvOrders: UITableView!
    
    private lazy var vm = OrdersHistoryVM(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
        vm.fetchOrdersHistory()
    }
    
    private func setupViews() {
        lblTitle.font = .popB24
        
        tvOrders.registerCell(OrderCell.self)
        tvOrders.dataSource = self
        tvOrders.delegate = self
        tvOrders.estimatedRowHeight = 100
        tvOrders.rowHeight = UITableView.automaticDimension
        tvOrders.separatorStyle = .none
        tvOrders.contentInset = .zero
        
    }
    
    private func setupBindings() {
        
    }

}

extension OrdersHistoryVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(OrderCell.self, for: indexPath)
        // TODO - Pass Data to the cell here
        return cell
    }
    
    // TODO - Go to Order Detail Here
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Going to Order Detail with index at: \(indexPath.row)")
        
        let vc = OrdersHistoryDetailVC.instantiate()
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

extension OrdersHistoryVC: OrdersHistoryViewDelegate {
    func onLoadOrdersHistory() {
        DispatchQueue.main.async { [weak self] in
            self?.tvOrders.reloadData()
        }
    }
}
