//
//  AppDelegate.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var isLoggedIn = false
    
    static var singleton: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SplashScreen()
        window?.makeKeyAndVisible()
        AppDelegate.singleton.window = window
        
        return true
    }
    
    func goToLogin() {
        window?.rootViewController = Login()
    }
    func goToHome() {
        window?.rootViewController = UINavigationController(rootViewController: Home())
    }
}


