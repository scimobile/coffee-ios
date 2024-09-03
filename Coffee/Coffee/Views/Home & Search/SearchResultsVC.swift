//
//  SearchResultsVC.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/19/24.
//

import UIKit

class SearchResultsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint

        setupLabel()
    }

    private func setupLabel() {
        
        let label = UILabel()
        
        label.text = "No results found"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
