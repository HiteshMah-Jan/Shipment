//
//  GitHubPopUp.swift
//  Pace
//
//  Created by Gugulethu Mhlanga on 2016/07/31.
//  Copyright © 2016 Canaan Studios. All rights reserved.
//

import UIKit

class PopLauncher : NSObject {
    
    //  Gradient Background View
    let gradientBackground : UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.masksToBounds = true
        return view
        
    }()
    
    //  PopUpView
    let downloadedPopup : UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 0.0
        view.layer.masksToBounds = true
        return view
        
        
    }()
    
    //  Information Label
    
    let checkoutBtn : UIButton = {
        let button = UIButton()
        button.tintColor = UIColor.white
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-UltraLight", size: 18)!
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.backgroundColor = UIColor.black
        button.isUserInteractionEnabled = true
        button.setTitleColor(UIColor.gray, for: UIControlState.highlighted)
        return button
    }()
    
    //  Initialisation
    override init() {
        super.init()
    }
    
    // Show Pop Up
    func showPopUp(roundedViewBackgroundColor: UIColor, checkBtnTitle: String, checkBtnBackColor: UIColor, durationOnScreen: Double, currentView: UIView, isAboveTabBar: Bool, vc: UIViewController) {
        
        
        if let window = UIApplication.shared.keyWindow {
            
            //  Gradient Background
            gradientBackground.backgroundColor = UIColor.clear
            gradientBackground.frame = CGRect(x: 0, y: window.frame.height+54, width: window.frame.width, height: 40)
            
            gradientBackground.layer.masksToBounds = true
            currentView.addSubview(gradientBackground)
            
            //  Download Popup
            gradientBackground.addSubview(downloadedPopup)
            downloadedPopup.frame = CGRect(x: 0, y: 0, width: window.frame.width, height: 50)
            downloadedPopup.backgroundColor = roundedViewBackgroundColor
            
            //  Information Label
   
            downloadedPopup.addSubview(checkoutBtn)
            checkoutBtn.frame = CGRect(x: 10, y: 10, width: window.frame.width-20, height: 40)
            checkoutBtn.setTitle(checkBtnTitle, for: .normal)
            checkoutBtn.backgroundColor = checkBtnBackColor
            checkoutBtn.addTarget(vc, action: #selector(ShipmentTableVC.checkout), for: .touchUpInside)
            
            let lineView = UIView(frame: CGRect(x: 0, y: 0, width: window.frame.width, height: 1))
            lineView.layer.borderWidth = 0.5
            lineView.layer.borderColor = UIColor.hexStr(hexStr: "7f8c8d", alpha: 0.8).cgColor
            downloadedPopup.addSubview(lineView)
            //  #### Timer to Hide it
            //Timer.scheduledTimer(timeInterval: durationOnScreen, target: self, selector: #selector(dismissConfimationPopup), userInfo: nil, repeats: false)
            
            
            //  #### Animate the Views In
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                if isAboveTabBar == true {
                    
                    self.gradientBackground.frame = CGRect(x: 0, y: window.frame.height - 110, width: window.frame.width, height: 80)
                    
                } else {
                    
                    self.gradientBackground.frame = CGRect(x: 0, y: window.frame.height - 60, width: window.frame.width, height: 50)
                }
                
                
                }, completion: nil)
            
        }
    }
    
    //  Dismiss Views
    func dismissConfimationPopup() {
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 10.0, initialSpringVelocity: 1, options: .curveLinear, animations: {
            
            
            if let window = UIApplication.shared.keyWindow {
                
                self.gradientBackground.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: 50)
                
                //self.downloadedPopup.frame = CGRect(x: 10, y: window.frame.height, width: window.frame.width - 20, height: 90)
                
            }
            
            }, completion: nil)
        
        
    }

}
