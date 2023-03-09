//
//  UIView.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit

private let CORNER_RADIUS = CGFloat(12)
private let SHADOW_RADIUS = CGFloat(4)

extension UIView {
    func addShadow(radius: CGFloat = SHADOW_RADIUS, rasterize: Bool = false) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = radius/2
        
        if (rasterize) {
            layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }
    
    func roundCorners(radius: CGFloat = CORNER_RADIUS) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    func roundRightCorners(radius: CGFloat = CORNER_RADIUS) {
        layer.cornerRadius = radius
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
}
