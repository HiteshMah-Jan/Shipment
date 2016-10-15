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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        roundedView.layer.cornerRadius = 12.5
        roundedView.layer.borderWidth = 2
        roundedView.layer.borderColor = UIColor.gray.cgColor
        
        dashed(v: self.dashedView)
        //dashed(v: dashedTop)
        
    }
    
    func dashed(v: UIView) {
        let color = UIColor.orange.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = v.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: 1, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: 6, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [4]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 0).cgPath
        v.layer.addSublayer(shapeLayer)
        
    }

}
