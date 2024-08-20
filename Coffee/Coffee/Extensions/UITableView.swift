//
//  UITableView.swift
//  Coffee
//
//  Created by Wai Thura Tun on 8/20/24.
//

import Foundation
import UIKit

extension UITableView {
    
    func dequeueCell<cell: UITableViewCell>(_ cellType: cell.Type, for indexPath: IndexPath) -> cell {
        let identifier = String(describing: cellType)
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! cell
    }
    
    func registerCell<cell: UITableViewCell>(_ cellType: cell.Type, bundle: Bundle? = nil) {
        let identifier = String(describing: cellType)
        let nib = UINib(nibName: identifier, bundle: bundle)
        return self.register(nib, forCellReuseIdentifier: identifier)
    }
    
}
