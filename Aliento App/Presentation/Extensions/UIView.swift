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
    
    private func addGradientLayer() -> CAGradientLayer {
        var gradientColorOne : CGColor = UIColor(white: 0.85, alpha: 1.0).cgColor
        var gradientColorTwo : CGColor = UIColor(white: 0.95, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(gradientLayer)
        
        return gradientLayer
    }
    
    private func addAnimation() -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.9
        return animation
    }
    
    func startShimmering() {
        
        let gradientLayer = addGradientLayer()
        let animation = addAnimation()
        
        gradientLayer.add(animation, forKey: animation.keyPath)
    }
    
    func stopShimmering() {
        layer.mask = nil
        let gradientLayer = layer.sublayers?.first
        gradientLayer?.removeFromSuperlayer()
    }
}


