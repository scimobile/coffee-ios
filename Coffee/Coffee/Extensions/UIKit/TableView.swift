//
//  TableView.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/14/24.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(ofType cell: T.Type) {
        self.register(.init(nibName: cell.identifier, bundle: .main), forCellReuseIdentifier: cell.identifier)
    }
    
    func deque<T: UITableViewCell>(_ type: T.Type, _ indexPath: IndexPath) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! T
        return cell
    }
}
