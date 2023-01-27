//
//  DonationsVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 26/01/23.
//

import UIKit

class DonationsVC : UIViewController {
    
    @IBOutlet var cardDonationsBbva: UIView!
    @IBOutlet var shadowDonationsBbva: UIView!
    @IBOutlet var bbva: UIImageView!
    @IBOutlet var paypal: UIImageView!
    @IBOutlet var shadowDonationsPayPal: UIView!
    @IBOutlet var cardDonationsPayPal: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bbva.isUserInteractionEnabled = true
        bbva.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardOneBbva)))
        shadowDonationsBbva.addShadow()
        cardDonationsBbva.roundCorners()
        
        paypal.isUserInteractionEnabled = true
        paypal.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardTwoPaypal)))
        shadowDonationsPayPal.addShadow()
        cardDonationsPayPal.roundCorners()
        
        setNavBarLogo()
        
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
   
    @objc func cardOneBbva() {
        print("Se presiono BBVA")
        // handling code
        
    }
    
    @objc func cardTwoPaypal() {
        print("Se presiono PAYPAL")
        // handling code
        
    }
}
