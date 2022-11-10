//
//  Home.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 08/09/22.
//

import UIKit

class Home: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeRepository.getHome() { (result) in
            print(result)
        }
        
        self.title = "Test 4"
        
    }
    
    @IBAction func goToPredicas(_ sender: Any) {
        navigationController?.pushViewController(Predicas(), animated: true)
    }
}
        

