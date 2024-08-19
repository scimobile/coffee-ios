//
//  CarouselCell.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

protocol CarouselCellDelegate: AnyObject {
    func carouselCell(_ cell: CarouselCell, didTapAddProductAt indexPath: IndexPath)
}

class CarouselCell: UITableViewCell {
    
    weak var delegate: CarouselCellDelegate?
    
    @IBOutlet weak var lblCarouselTitle: UILabel!
    @IBOutlet weak var cvCarousel: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cvCarousel.register(.init(nibName: "CarouselItemCell", bundle: nil), forCellWithReuseIdentifier: "CarouselItemCell")
        cvCarousel.delegate = self
        cvCarousel.dataSource = self
        
//        let layout = SnappingFlowLayout()
//        layout.scrollDirection = .horizontal
//        cvCarousel.collectionViewLayout = layout
        
        cvCarousel.decelerationRate = .fast
        selectionStyle = .none
        
        lblCarouselTitle.font = AppFont.poppinsSemibold.of(size: 34)
        lblCarouselTitle.textColor = AppColor.secondary.color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension CarouselCell: CarouselItemCellDelegate {
    func didTapAddProductButton(on cell: CarouselItemCell) {
        if let indexPath = cvCarousel.indexPath(for: cell) {
            delegate?.carouselCell(self, didTapAddProductAt: indexPath)
        }
    }
    
    
}

extension CarouselCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselItemCell", for: indexPath) as? CarouselItemCell else {return UICollectionViewCell()}
        cell.delegate = self
        cell.imageUrl = ""
        return cell
    }
}

extension CarouselCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: collectionView.frame.width/2 - 16 - 16, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 30)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

