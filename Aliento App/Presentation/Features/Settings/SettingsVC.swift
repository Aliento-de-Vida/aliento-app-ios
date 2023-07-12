//
//  settingsVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import UIKit
import FirebaseMessaging
import FirebaseCore

let NOTIFICATION_TOPIC = "push_notifications"

class SettingsVC : UIViewController {
    private let userDefaults = UserDefaults.standard

    @IBAction func darkModeSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            AppDelegate.singleton.setDarkTheme(enabled: true)
        } else {
            AppDelegate.singleton.setDarkTheme(enabled: false)
        }
    }
    @IBOutlet var switchDarkMode: UISwitch!
    @IBOutlet var switchNotifications: UISwitch!
    
    @IBAction func notificationsPush(_ subscribe: UISwitch) {
        if (subscribe.isOn) {
            Messaging.messaging().subscribe(toTopic: NOTIFICATION_TOPIC)
            userDefaults.set(true, forKey: NOTIFICATIONS_SUBSCRIPTION_KEY)
        } else {
            Messaging.messaging().unsubscribe(fromTopic: NOTIFICATION_TOPIC)
            userDefaults.set(false, forKey: NOTIFICATIONS_SUBSCRIPTION_KEY)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.traitCollection.userInterfaceStyle == .dark {
            switchDarkMode.isOn = true
        } else {
            switchDarkMode.isOn = false
        }
    
        if (userDefaults.bool(forKey: NOTIFICATIONS_SUBSCRIPTION_KEY)) {
            switchNotifications.isOn = true
        } else {
            switchNotifications.isOn = false
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
