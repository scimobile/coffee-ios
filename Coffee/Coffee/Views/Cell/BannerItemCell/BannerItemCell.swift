//
//  BannerItemCell.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/14/24.
//

import UIKit
import Foundation
import Kingfisher

class BannerItemCell: UICollectionViewCell {
    
    @IBOutlet weak var ivPromo: UIImageView!
    
    var imageUrl: String? = nil {
        didSet{
            if let imageUrl = imageUrl {
                let url = URL(string: imageUrl)
                let processor = DownsamplingImageProcessor(size: ivPromo.bounds.size)
                ivPromo.kf.indicatorType = .activity
                ivPromo.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "coffee-promotion"),
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
    }

}
