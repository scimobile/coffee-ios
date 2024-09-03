//
//  CarouselItemCell.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit
import Kingfisher

protocol CarouselItemCellDelegate: AnyObject {
    func didTapAddProductButton(on cell: CarouselItemCell)
}

class CarouselItemCell: UICollectionViewCell {
    
    weak var delegate: CarouselItemCellDelegate?

    @IBOutlet weak var vCell: UIView!
    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var btnAddProduct: UIButton!
    
    var imageUrl: String? = nil {
        didSet{
            if let imageUrl = imageUrl {
                let url = URL(string: imageUrl)
                let processor = DownsamplingImageProcessor(size: ivProduct.bounds.size)
                ivProduct.kf.indicatorType = .activity
                ivProduct.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "coffee-product"),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.flipFromBottom(1)),
                        .cacheOriginalImage
                    ])
                {
                    result in
                    switch result {
                    case .success(let value):
                        print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                    }
                }
                
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vCell.backgroundColor = .coffeeGray
        vCell.layer.cornerRadius = 20
        
        lblProductName.text = "Dummy Product Name"
        lblProductName.font = .popM14
        lblProductName.textColor = .secondary
        
        lblProductPrice.text = "$300.24"
        lblProductPrice.font = .popM14
        lblProductPrice.textColor = .secondary
        
        let btnImg = UIImage.init(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .bold) )
        btnAddProduct.setImage(btnImg, for: .normal)
        btnAddProduct.tintColor = .secondary
        btnAddProduct.addTarget(self, action: #selector(addProductTapped), for: .touchUpInside)
    }
    
    @objc private func addProductTapped() {
        print("Tapped the Add Product Button")
        delegate?.didTapAddProductButton(on: self)
    }

}
