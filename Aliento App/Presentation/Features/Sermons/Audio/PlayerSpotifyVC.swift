//
//  PlayerSpotify.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/06/23.
//

import UIKit
import Resolver

class PlayerSpotifyVC : UIViewController {
    
    
    override func viewDidLoad() {
        UIApplication.shared.canOpenURL(URL(string: "spotify:")!)
    }
}
