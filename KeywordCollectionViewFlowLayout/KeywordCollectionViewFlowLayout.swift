//
//  KeywordCollectionViewFlowLayout.swift
//  KeywordCollectionViewFlowLayout
//
//  Created by HikaruSato on 2019/01/21.
//  Copyright (c) 2019年 HikaruSato. All rights reserved.
//

import UIKit

protocol KeywordCollectionViewFlowLayoutDelegate {
    func collectionView(collectionView:UICollectionView, widthAtIndexPath indexPath:IndexPath) -> CGFloat
}

open class KeywordCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var delegate: KeywordCollectionViewFlowLayoutDelegate!
    fileprivate var sectionCellRects = [[CGRect]]()
    fileprivate var contentSize = CGSize.zero
    
    override open func prepare() {
        super.prepare()
        
        if (!sectionCellRects.isEmpty) {
            return
        }
        
        guard let collectionView = self.collectionView else {
            return
        }
        let cellHeight: CGFloat = itemSize.height
        let maxWidth = collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
        contentSize = CGSize(width: 0, height: 0)
        var xOffset: CGFloat = super.sectionInset.left
        var yOffset: CGFloat = super.sectionInset.top
        for section in (0..<collectionView.numberOfSections) {
            var cells = [CGRect]()
            let numberOfCellsInSection = collectionView.numberOfItems(inSection: section)
            
            var height = contentSize.height
            
            for i in (0..<numberOfCellsInSection) {
                let cellwidth = delegate.collectionView(collectionView: collectionView, widthAtIndexPath: IndexPath(row: i, section: section))
                var x = xOffset
                if x + cellwidth + super.minimumInteritemSpacing > maxWidth {
                    //New Line
                    x = super.sectionInset.left
                    yOffset += cellHeight + super.minimumLineSpacing
                    xOffset = x + cellwidth + minimumInteritemSpacing
                } else {
                    xOffset += cellwidth + super.minimumInteritemSpacing
                }
                let y = yOffset
                
                let cellRect = CGRect(x: x, y: y, width: cellwidth, height: cellHeight)
                cells.append(cellRect)
                if (height < cellRect.origin.y + cellRect.height) {
                    height = cellRect.origin.y + cellRect.height
                }
            }
            height += cellHeight + super.minimumLineSpacing
            contentSize = CGSize(width: maxWidth, height: height)
            sectionCellRects.append(cells)
        }
    }
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        super.layoutAttributesForElements(in: rect)
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        if let collectionView = self.collectionView {
            for  i in 0  ..< collectionView.numberOfSections {
                let numberOfCellsInSection = collectionView.numberOfItems(inSection: i)
                for j in 0 ..< numberOfCellsInSection {
                    let indexPath = IndexPath(row:j, section:i)
                    if let attributes = layoutAttributesForItem(at: indexPath) {
                        if (rect.intersects(attributes.frame)) {
                            layoutAttributes.append(attributes)
                        }
                    }
                }
            }
        }
        return layoutAttributes
    }
    
    override open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.layoutAttributesForItem(at: indexPath)
        attributes?.frame = sectionCellRects[indexPath.section][indexPath.row]
        return attributes
    }
    
    override open var collectionViewContentSize : CGSize {
        return contentSize
    }
}
