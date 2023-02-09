//
//  settingsVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit

class SettingsVC : UIViewController {
   
    @IBAction func darkModeSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            AppDelegate.singleton.setDarkTheme(enabled: true)
        } else {
            AppDelegate.singleton.setDarkTheme(enabled: false)
        }
    }
    @IBOutlet var switchDarkMode: UISwitch!
    
    @IBOutlet var notificationsPush: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.traitCollection.userInterfaceStyle == .dark {
            switchDarkMode.isOn = true
        } else {
            switchDarkMode.isOn = false
        }
     
        setNavBarLogo()
        
    }
   
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
                
        self.navigationItem.titleView = imageView
       
    }
    
}
