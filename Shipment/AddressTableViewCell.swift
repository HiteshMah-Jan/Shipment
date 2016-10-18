//
//  AddressTableViewCell.swift
//  Shipment
//
//  Created by Atakishiyev Orazdurdy on 10/15/16.
//  Copyright © 2016 Veriloft. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var dashedView: UIView!
    @IBOutlet weak var dashedTop: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        roundedView.layer.cornerRadius = 12.5
        roundedView.layer.borderWidth = 2
        roundedView.layer.borderColor = UIColor.gray.cgColor
    }
    
}
