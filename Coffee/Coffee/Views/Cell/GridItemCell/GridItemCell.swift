//
//  GridItemCell.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit
import Kingfisher

class GridItemCell: UICollectionViewCell {
    
    
    @IBOutlet weak var ivGrid: UIImageView!
    
    var imageUrl: String? = nil {
        didSet{
            if let imageUrl = imageUrl {
                let url = URL(string: imageUrl)
                let processor = DownsamplingImageProcessor(size: ivGrid.bounds.size)
                ivGrid.kf.indicatorType = .activity
                ivGrid.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "coffee-grid"),
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
