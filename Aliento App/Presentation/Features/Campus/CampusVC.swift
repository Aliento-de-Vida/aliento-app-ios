//
//  CampusVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 18/01/23.
//

import UIKit

class CampusVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBarLogo()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }

}

