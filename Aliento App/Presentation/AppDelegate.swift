//
//  AppDelegate.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var singleton: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        setDarkTheme(enabled: false)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SplashScreen()
        window?.makeKeyAndVisible()
        AppDelegate.singleton.window = window
        
        return true
    }
    
    func setDarkTheme(enabled: Bool) {
        if enabled {
            window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }
        
    func goToHome() {
        window?.rootViewController = UINavigationController(rootViewController: HomeVC())
    }
}



