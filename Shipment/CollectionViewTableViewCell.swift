//
//  CollectionViewTableViewCell.swift
//  Shipment
//
//  Created by Atakishiyev Orazdurdy on 10/15/16.
//  Copyright © 2016 Veriloft. All rights reserved.
//

import UIKit

protocol CollectionViewSelectedProtocol {
    func collectionViewSelected(collectionViewItem : Int)
    func selectedTypeForRow(tableRow: Int, collectionViewPath: IndexPath)
}

class CollectionViewTableViewCell: UITableViewCell, ShipmentDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var collectionViewDataSource : UICollectionViewDataSource!
    
    var collectionViewDelegate : UICollectionViewDelegate!
    
    var delegate : CollectionViewSelectedProtocol!
    
    var collectionViewOffset: CGFloat {
        set {
            collectionView.contentOffset.x = newValue
        }
        
        get {
            return collectionView.contentOffset.x
        }
    }
    
    var tRow = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(type: [SelectType]) {
        pageControl.numberOfPages = type.count
    }
    
    func initializeCollectionViewWithDataSource<D: UICollectionViewDataSource,E: UICollectionViewDelegate>(dataSource: D, delegate :E, forRow row: Int) {
        
        if let delegate = delegate as? ShipmentCollectionViewDataSource {
            delegate.delegate = self
        }
        
        self.collectionViewDataSource = dataSource
        
        self.collectionViewDelegate = delegate
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        collectionView.register(ShipmentCollectionViewCell.self)
        self.collectionView.clipsToBounds = true
        self.clipsToBounds = true
        //collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self.collectionViewDataSource
        collectionView.delegate = self.collectionViewDelegate
        collectionView.tag = row
        collectionView.isPagingEnabled = true
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
    }
    
    func didScroll(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        detection()
    }
    
    func detection() {
        if let indexPath:IndexPath = collectionView?.indexPathsForVisibleItems[0] {
            switch tRow {
            case 0:
                saveType(value: StoredType(tableRow: tRow, collectionRow: indexPath.row), key: opt0)
                self.delegate.selectedTypeForRow(tableRow: tRow, collectionViewPath: indexPath)
            case 1:
                saveType(value: StoredType(tableRow: tRow, collectionRow: indexPath.row), key: opt1)
                self.delegate.selectedTypeForRow(tableRow: tRow, collectionViewPath: indexPath)
            default:
                break
            }
        }
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        let currentPage = pageControl.currentPage - 1
        if currentPage < 0 {
            return
//            currentPage = pageControl.numberOfPages-1
//            self.collectionView.scrollRectToVisible(CGRect(x: Int(self.frame.width*CGFloat(currentPage)), y: 0, width: Int(self.frame.width), height: Int(self.bounds.height)), animated: false)
        }else{
            self.collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        }
        pageControl.currentPage = currentPage
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        let currentPage = pageControl.currentPage + 1
        
        if currentPage >= pageControl.numberOfPages {
            return
//            currentPage = 0
//            self.collectionView.scrollRectToVisible(CGRect(x: Int(self.frame.width*CGFloat(currentPage)), y: 0, width: Int(self.frame.width), height: Int(self.bounds.height)), animated: false)
        }else{
            self.collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0), at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        }
        pageControl.currentPage = currentPage
    }
}
