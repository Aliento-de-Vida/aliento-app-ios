//
//  UIView.swift
//  Aliento App
//
//  Created by Pedro Antonio on 10/01/23.
//

import UIKit

extension UIView {
    func addShadow(rasterize: Bool = false) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        if (rasterize) {
            layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }
}
