//
//  SnappingFlowLayout.swift
//  Coffee
//
//  Created by Zarni Nway Oo on 8/14/24.
//

import Foundation
import UIKit

class SnappingFlowLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        // Calculate the target rect
        let targetRect = CGRect(origin: proposedContentOffset, size: collectionView!.bounds.size)
        
        // Get the layout attributes for the visible items in the target rect
        let layoutAttributes = super.layoutAttributesForElements(in: targetRect)
        
        // Find the closest attribute to the center
        var closestAttribute: UICollectionViewLayoutAttributes?
        let centerX = proposedContentOffset.x + collectionView!.bounds.size.width / 2
        
        for attributes in layoutAttributes ?? [] {
            if closestAttribute == nil || abs(attributes.center.x - centerX) < abs(closestAttribute!.center.x - centerX) {
                closestAttribute = attributes
            }
        }
        
        // Calculate the new offset by aligning the closest attribute to the center
        if let closest = closestAttribute {
            let newOffsetX = closest.center.x - collectionView!.bounds.size.width / 2
            return CGPoint(x: newOffsetX, y: proposedContentOffset.y)
        }
        
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
    }
}

