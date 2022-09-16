//
//  Login.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

class Login: UIViewController {
    
    @IBAction func performLogin(_ sender: UIButton) {
        AppDelegate.singleton.isLoggedIn = true
        AppDelegate.singleton.goToHome()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
