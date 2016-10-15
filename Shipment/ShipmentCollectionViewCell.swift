//
//  ShipmentCollectionViewCell.swift
//  Shipment
//
//  Created by Atakishiyev Orazdurdy on 10/15/16.
//  Copyright © 2016 Veriloft. All rights reserved.
//

import UIKit

protocol ShipmentCollectionViewCellProtocol: class {
    func leftTapped()
    func rightTapped()
}

class ShipmentCollectionViewCell: UICollectionViewCell, NibLoadableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    weak var delegate: ShipmentCollectionViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(selectType: SelectType) {
        self.titleLabel.text = selectType.title
        self.subtitleLabel.text = selectType.option
    }

}
