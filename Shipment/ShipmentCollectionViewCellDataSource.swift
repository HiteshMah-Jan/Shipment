//
//  ShipmentCollectionViewCellDataSource.swift
//  Shipment
//
//  Created by Atakishiyev Orazdurdy on 10/15/16.
//  Copyright © 2016 Veriloft. All rights reserved.
//

import UIKit

protocol ShipmentDelegate: class {
    func didScroll(scrollView: UIScrollView)
}

class ShipmentCollectionViewDataSource : UICollectionViewLayout, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var selectType : [SelectType]!
    
    weak var delegate: ShipmentDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShipmentCollectionViewCell", for: indexPath) as? ShipmentCollectionViewCell else {
            fatalError()
        }
        cell.config(selectType: self.selectType[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //guard let collectionViewCell = cell as? ShipmentCollectionViewCell else { return }
        //collectionViewCell.backgroundColor = UIColor.gray
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("cell no: \(indexPath.row) of collection view: \(collectionView.tag)")
    }
    
    // MARK: UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15.0, left: 0.0, bottom: 0.0, right: 0.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let targetWidth: CGFloat = CGFloat((collectionView.frame.width))
        let height = CGFloat((collectionView.frame.height))
        let size = CGSize(width: targetWidth, height: height-15)
        
        return size
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.delegate?.didScroll(scrollView: scrollView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.delegate?.didScroll(scrollView: scrollView)
    }

}
