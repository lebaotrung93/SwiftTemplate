//
//  UIViewExtension.swift
//  Extension
//
//  Created by Luck on 8/23/19.
//  Copyright © 2019 Luck. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue?.cgColor
            layer.masksToBounds = false
            layer.shadowOffset = CGSize(width:5,height: 5)
            layer.shadowOpacity = 0.5
        }
    }
    
    func createShadow(border : CGFloat, shadowColor : UIColor, shadowSize : CGSize, shadowOpacity : Float, typeCorner : UIRectCorner = UIRectCorner.allCorners)  {
        let shadowPath = UIBezierPath(roundedRect: CGRect(x: 1, y: 3, width:self.frame.width  , height: self.frame.height ), byRoundingCorners: typeCorner, cornerRadii: CGSize(width: border, height: border))
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowSize
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = border
        self.layer.masksToBounds =  false
        self.layer.shadowPath = shadowPath.cgPath
        
    }
    
    func setCorner(radius : CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setCorner(radius : CGFloat, color : UIColor, borderWidth : CGFloat = 1) {
        self.layer.cornerRadius = radius
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat, color : UIColor){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners,
                                cornerRadii:CGSize(width:radius, height:radius))
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        mask.strokeColor = color.cgColor
        mask.lineWidth = 0.5
        self.layer.mask = mask
    }
    
    func roundCornersView(_ corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners,
                                cornerRadii:CGSize(width:radius, height:radius))
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        self.layer.mask = mask
        
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners,
                                cornerRadii:CGSize(width:radius, height:radius))
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}


class RoundableView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        //        roundCorners([.topLeft, .bottomLeft], radius: 4.0)
    }
}
