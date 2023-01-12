//
//  CardWithShadow.swift
//  Aliento App
//
//  Created by Pedro Antonio on 12/01/23.
//

import UIKit

class RoundShadowView: UIView {
  
    let containerView = UIView()
    let cornerRadius: CGFloat = 6.0
  
    override init(frame: CGRect) {
        super.init(frame: frame)

        layoutView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func layoutView() {
      
      // set the shadow of the view's layer
      layer.backgroundColor = UIColor.clear.cgColor
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOffset = CGSize(width: 0, height: 1.0)
      layer.shadowOpacity = 0.2
      layer.shadowRadius = 4.0
        
      // set the cornerRadius of the containerView's layer
      containerView.layer.cornerRadius = cornerRadius
      containerView.layer.masksToBounds = true
      
      addSubview(containerView)
      
      //
      // add additional views to the containerView here
      //
      
      // add constraints
      containerView.translatesAutoresizingMaskIntoConstraints = false
      
      // pin the containerView to the edges to the view
      containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
      containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
      containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
      containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
