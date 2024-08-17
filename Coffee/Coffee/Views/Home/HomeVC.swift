//
//  HomeVC.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/12/24.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tvHome: UITableView!
    private var floatingCartButton: UIButton!
    private var badgeLabel: UILabel!
    private var cartItems: [IndexPath] = []
    
    let searchController = UISearchController(searchResultsController: UIViewController())
    
//    let floatingButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
////        button.layer.masksToBounds = true
//        button.layer.cornerRadius = 8
//        button.layer.shadowRadius = 10
//        button.layer.shadowOpacity = 0.3
//        button.layer.shadowColor = AppColor.secondary.color.cgColor
//        button.backgroundColor = AppColor.primary.color
//        
//        let image = UIImage(systemName: "cart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))
//        button.setImage(image, for: .normal)
//        button.tintColor = AppColor.eggWhite.color
//        
//        return button
//    }()
//    
//    let badgeLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = AppColor.coffeeRed.color
//        label.textColor = .white
//        label.font = AppFont.poppinsBold.of(size: 12)
//        label.textAlignment = .center
//        label.layer.cornerRadius = 10
//        label.clipsToBounds = true
//        label.text = "3"
//        return label
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //search bar
        title = "Home"
        navigationItem.searchController = searchController
        setupView()
//        view.addSubview(floatingButton)
//        floatingButton.addSubview(badgeLabel)
        setupFloatingCartButton()

    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        floatingButton.frame = CGRect(
//            x: view.frame.size.width - 60,
//            y: view.frame.size.height - 150,
//            width: 50,
//            height: 50)
//        
//        let badgeSize: CGFloat = 20
//        badgeLabel.frame = CGRect(
//            x: floatingButton.frame.width - badgeSize - 35,
//            y: -badgeSize / 2,
//            width: badgeSize,
//            height: badgeSize
//        )
//    }
    
    func setupView() {
        tvHome.registerCell(ofType: BannerCell.self)
        tvHome.registerCell(ofType: CarouselCell.self)
        tvHome.registerCell(ofType: GridCell.self)
        
        tvHome.dataSource = self
        tvHome.delegate = self
        
        tvHome.estimatedRowHeight = 100
        tvHome.rowHeight = UITableView.automaticDimension
        tvHome.separatorStyle = .none
        tvHome.contentInset = .zero
        
        tvHome.showsVerticalScrollIndicator = false
        tvHome.showsHorizontalScrollIndicator = false
        
    }
    
    func setupFloatingCartButton() {
        let image = UIImage(systemName: "cart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .medium))
        floatingCartButton = UIButton(type: .system)
        floatingCartButton.setImage(image, for: .normal)
        floatingCartButton.backgroundColor = AppColor.primary.color
        floatingCartButton.tintColor = AppColor.eggWhite.color
        floatingCartButton.layer.cornerRadius = 8
        floatingCartButton.layer.cornerRadius = 8
        floatingCartButton.layer.shadowRadius = 10
        floatingCartButton.layer.shadowOpacity = 0.3
        floatingCartButton.layer.shadowColor = AppColor.secondary.color.cgColor
        floatingCartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        view.addSubview(floatingCartButton)
        
        floatingCartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            floatingCartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            floatingCartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            floatingCartButton.widthAnchor.constraint(equalToConstant: 50),
            floatingCartButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        badgeLabel = UILabel()
        badgeLabel.backgroundColor = AppColor.coffeeRed.color
        badgeLabel.textColor = AppColor.eggWhite.color
        badgeLabel.font = AppFont.poppinsBold.of(size: 12)
        badgeLabel.textAlignment = .center
        badgeLabel.layer.cornerRadius = 10
        badgeLabel.clipsToBounds = true
        badgeLabel.isHidden = true  //hidden
        floatingCartButton.addSubview(badgeLabel)
        
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badgeLabel.topAnchor.constraint(equalTo: floatingCartButton.topAnchor, constant: -5),
            badgeLabel.leadingAnchor.constraint(equalTo: floatingCartButton.leadingAnchor, constant: -5),
            badgeLabel.widthAnchor.constraint(equalToConstant: 20),
            badgeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        floatingCartButton.isHidden = true
    }
    
    @objc private func cartButtonTapped() {
        // Navigate to cart view
    }
    
    private func addToCart(indexPath: IndexPath) {
        print("Item added")
        cartItems.append(indexPath)
        updateBadge()
        floatingCartButton.isHidden = cartItems.isEmpty
    }
    
    private func updateBadge() {
        let itemCount = cartItems.count
        badgeLabel.text = "\(itemCount)"
        badgeLabel.isHidden = itemCount == 0
    }
}

extension HomeVC: CarouselCellDelegate {
    func carouselCell(_ cell: CarouselCell, didTapAddProductAt indexPath: IndexPath) {
        addToCart(indexPath: indexPath)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.deque(BannerCell.self, indexPath)
            return cell
        case 1:
            let cell = tableView.deque(CarouselCell.self, indexPath)
            cell.lblCarouselTitle.text = "Popular"
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.deque(CarouselCell.self, indexPath)
            cell.lblCarouselTitle.text = "New Flavor"
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.deque(CarouselCell.self, indexPath)
            cell.lblCarouselTitle.text = "Recommended"
            cell.delegate = self
            return cell
        case 4:
            let cell = tableView.deque(GridCell.self, indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
