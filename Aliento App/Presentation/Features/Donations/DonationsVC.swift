//
//  DonationsVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 26/01/23.
//

import UIKit

class DonationsVC : UIViewController, UIContextMenuInteractionDelegate {
    
    @IBOutlet var cardDonationsBbva: UIView!
    @IBOutlet var shadowDonationsBbva: UIView!
    @IBOutlet var bbva: UIImageView!
    @IBOutlet var paypal: UIImageView!
    @IBOutlet var shadowDonationsPayPal: UIView!
    @IBOutlet var cardDonationsPayPal: UIView!
    @IBOutlet var cardNumber: UILabel!
    @IBOutlet var clabe: UILabel!
    @IBOutlet var numeroCuenta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowDonationsBbva.addShadow()
        cardDonationsBbva.roundCorners()
        
        let interaction = UIContextMenuInteraction(delegate: self)
        bbva.addInteraction(interaction)
        bbva.isUserInteractionEnabled = true
        
        paypal.isUserInteractionEnabled = true
        paypal.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cardTwoPaypal)))
        shadowDonationsPayPal.addShadow()
        cardDonationsPayPal.roundCorners()
        
        setNavBarLogo()
        
    }
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
            return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
                return self.createContextMenu()
            }
         }
    
    func createContextMenu() -> UIMenu {
        let copy = UIAction(title: "Numero de Tarjeta", image: UIImage(systemName: "doc.on.doc")) { [self] _ in
            guard let cardNumber = cardNumber.text else { return }
            let generator = UINotificationFeedbackGenerator()
            UIPasteboard.general.string = cardNumber.replacingOccurrences(of: " ", with: "")
            generator.notificationOccurred(.success)
        }
        let copyClabe = UIAction(title: "Clabe", image: UIImage(systemName: "doc.on.doc")) { [self] _ in
            guard let clabe = clabe.text else { return }
            let generator = UINotificationFeedbackGenerator()
            UIPasteboard.general.string = clabe.replacingOccurrences(of: " ", with: " ")
            generator.notificationOccurred(.success)
        }
        let copyAccountNumber = UIAction(title: "No de Cuenta", image: UIImage(systemName: "doc.on.doc")) { [self] _ in
            guard let clabe = numeroCuenta.text else { return }
            let generator = UINotificationFeedbackGenerator()
            UIPasteboard.general.string = clabe.replacingOccurrences(of: " ", with: " ")
            generator.notificationOccurred(.success)
        }
        return UIMenu(title: "", children: [copy, copyClabe, copyAccountNumber])
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
    
    @objc func cardTwoPaypal() {
        guard let PaypalClick = URL(string: "https://www.paypal.com/paypalme/AlientoDeVidaMx") else { return }
        UIApplication.shared.open(PaypalClick)
        print("Se presiono PAYPAL")
        // handling code
        
    }
}
