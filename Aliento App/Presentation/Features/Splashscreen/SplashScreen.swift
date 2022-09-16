//
//  SplashScreen.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

class SplashScreen: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView.alpha = 0.0
        
        UIView.animate(withDuration: 1.5, animations: {
            self.logoImageView.alpha = 1.0
        }) { (finished) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if AppDelegate.singleton.isLoggedIn {
                    AppDelegate.singleton.goToHome()
                } else {
                    AppDelegate.singleton.goToLogin()
                }
            }
        }

    }
    
}
