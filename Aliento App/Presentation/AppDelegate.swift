//
//  AppDelegate.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit
import FirebaseCore
import FirebaseMessaging
import GoogleMaps

let NOTIFICATIONS_SUBSCRIPTION_KEY = "push_notifications_subscription"

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
        
    static var singleton: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    internal var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyBfI_Vw5RUs0hE50JSZdtCgkO7bIiO--Lk")
        
        FirebaseApp.configure()
        
        UNUserNotificationCenter.current().delegate.self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
        application.registerForRemoteNotifications()
        
        initNotificationsSubscription()
        
        setDarkTheme(enabled: false)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SplashScreen()
        window?.makeKeyAndVisible()
        AppDelegate.singleton.window = window
        
        return true
    }
    
    private func initNotificationsSubscription() {
        let userDefaults = UserDefaults.standard
        
        if (userDefaults.object(forKey: NOTIFICATIONS_SUBSCRIPTION_KEY) == nil) {
            Messaging.messaging().subscribe(toTopic: NOTIFICATION_TOPIC)
            userDefaults.setValue(true, forKey: NOTIFICATIONS_SUBSCRIPTION_KEY)
        }
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



