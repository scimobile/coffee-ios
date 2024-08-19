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
    @IBOutlet weak var cvChip: UICollectionView!
    
    var chips = ["All", "Espresso", "Latte", "Cappuccino", "Americano", "Macchiato", "Mocha"]
    var selectedChip: String? = "All"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cvGrid.register(.init(nibName: "GridItemCell", bundle: nil), forCellWithReuseIdentifier: "GridItemCell")
        cvGrid.delegate = self
        cvGrid.dataSource = self
        
        cvChip.register(.init(nibName: "ChipItemCell", bundle: nil), forCellWithReuseIdentifier: "ChipItemCell")
        cvChip.delegate = self
        cvChip.dataSource = self
        
        DispatchQueue.main.async {
            self.cvGrid.reloadData()
        }
        
//        cvGrid.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == cvChip {
            selectedChip = chips[indexPath.item]
            DispatchQueue.main.async {
                self.cvGrid.reloadData()
            }
        }
    }
}

extension GridCell: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvChip {
            return chips.count
        } else if collectionView == cvGrid {
            switch selectedChip {
            case "All":
                return 13
            case "Espresso":
                return 1
            case "Latte":
                return 3
            case "Cappuccino":
                return 5
            case "Americano":
                return 7
            case "Macchiato":
                return 9
            case "Mocha":
                return 10
            default:
                return 0
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cvChip {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipItemCell", for: indexPath) as? ChipItemCell else { return UICollectionViewCell() }
            cell.lblChip.text = chips[indexPath.item]
            return cell
        } else if collectionView == cvGrid {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridItemCell", for: indexPath) as? GridItemCell else { return UICollectionViewCell() }
            cell.imageUrl = ""
            return cell
        }
        return UICollectionViewCell()
    }
}

extension GridCell: UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cvChip {
            let indexPath = IndexPath(item: indexPath.item, section: 0)
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipItemCell", for: indexPath) as? ChipItemCell else {
                return .zero
            }
            let chipLabel = cell.lblChip
            chipLabel?.text = chips[indexPath.item]
            chipLabel?.sizeToFit()
            
            return CGSize(width: chipLabel!.frame.width + 20, height: 40)
        } else if collectionView == cvGrid {
            return .init(width: collectionView.frame.width / 2 - 12, height: 250)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == cvChip {
            return .init(top: 0, left: 8, bottom: 0, right: 8)
        } else if collectionView == cvGrid {
            return .init(top: 0, left: 8, bottom: 0, right: 8)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == cvChip {
            return 8
        } else if collectionView == cvGrid {
            return 6
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == cvChip {
            return 8
        } else if collectionView == cvGrid {
            return 0
        }
        return 0
    }
}
