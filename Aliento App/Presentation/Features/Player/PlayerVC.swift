//
//  PlayerVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 26/01/23.
//

import UIKit

class PlayerVC : UIViewController {
    
    @IBOutlet var playerName: UITextField!
    @IBOutlet var playerEmail: UITextField!
    @IBOutlet var playerWhatsapp: UITextField!
    @IBOutlet var playerMensaje: UITextField!
    @IBOutlet var prayerMotivo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let menuMotivo = { (action: UIAction) in
            self.update(number: action.title)
        }
        prayerMotivo.menu = UIMenu(children: [
                  UIAction(title: "Elige un motivo", state: .on, handler: menuMotivo),
                  UIAction(title: "Salud", handler: menuMotivo),
                  UIAction(title: "Finanzas", handler: menuMotivo),
                  UIAction(title: "Familiar", handler: menuMotivo),
                  UIAction(title: "Personal", handler: menuMotivo),])
        prayerMotivo.showsMenuAsPrimaryAction = true
        if #available(iOS 15.0, *) {
            prayerMotivo.changesSelectionAsPrimaryAction = true
        } else {
            // Fallback on earlier versions
        }
         
        setNavBarLogo()
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor.black, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    func update(number:String) {
       if number == "option 1" {
           print("option 1 selected")
       }
   }
    
}
