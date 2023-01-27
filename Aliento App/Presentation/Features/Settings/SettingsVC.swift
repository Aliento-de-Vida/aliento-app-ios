//
//  settingsVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit

class SettingsVC : UIViewController {
    @IBOutlet var theme: UISwitch!
    @IBOutlet var notificationsPush: UISwitch!
    
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
