//
//  GridCell.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/13/24.
//

import UIKit

class GridCell: UITableViewCell {
    
    @IBOutlet weak var lblGridTitle: UILabel!
    @IBOutlet weak var cvGrid: DynamicHeightCV!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cvGrid.register(.init(nibName: "GridItemCell", bundle: nil), forCellWithReuseIdentifier: "GridItemCell")
        cvGrid.delegate = self
        cvGrid.dataSource = self
        
        cvGrid.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        selectionStyle = .none
        
        lblGridTitle.text = "Category"
        lblGridTitle.font = AppFont.poppinsSemibold.of(size: 34)
        lblGridTitle.textColor = AppColor.secondary.color
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension GridCell: UICollectionViewDelegate {
    
}

extension GridCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridItemCell", for: indexPath) as? GridItemCell else {return UICollectionViewCell()}
        cell.imageUrl = ""
        return cell
    }
}

extension GridCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: collectionView.frame.width/2 - 16 - 16, height: 146)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
