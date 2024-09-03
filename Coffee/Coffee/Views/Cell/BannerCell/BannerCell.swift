//
//  BannerCell.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

class BannerCell: UITableViewCell {

    
    @IBOutlet weak var lblBannerTitle: UILabel!
    @IBOutlet weak var cvBanner: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cvBanner.register(.init(nibName: "BannerItemCell", bundle: nil), forCellWithReuseIdentifier: "BannerItemCell")
        cvBanner.delegate = self
        cvBanner.dataSource = self
        cvBanner.isPagingEnabled = false
        
        let layout = SnappingFlowLayout()
        layout.scrollDirection = .horizontal
        
        cvBanner.collectionViewLayout = layout
        cvBanner.decelerationRate = .fast
        selectionStyle = .none
        lblBannerTitle.text = "Promotion"
        lblBannerTitle.font = .popSemiB34
        lblBannerTitle.textColor = .secondary
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension BannerCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerItemCell", for: indexPath) as? BannerItemCell else { return UICollectionViewCell() }
        cell.imageUrl = ""
        return cell
    }   
}

extension BannerCell: UICollectionViewDelegate {
    
}

extension BannerCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width - 16, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 12)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}
