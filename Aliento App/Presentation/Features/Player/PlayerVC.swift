//
//  PlayerVC.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 26/01/23.
//

import UIKit
import Combine
import MessageUI

class PlayerVC : UIViewController, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet var constraint1: NSLayoutConstraint!
    @IBOutlet var constraint2: NSLayoutConstraint!
    @IBOutlet var constraint3: NSLayoutConstraint!
    @IBOutlet var constraint4: NSLayoutConstraint!
    @IBOutlet var errorName: UILabel!
    @IBOutlet var errorEmail: UILabel!
    @IBOutlet var errorWhatsapp: UILabel!
    @IBOutlet var errorMessage: UILabel!
    @IBOutlet var playerName: UITextField!
    @IBOutlet var playerEmail: UITextField!
    @IBOutlet var playerWhatsapp: UITextField!
    @IBOutlet var playerMensaje: UITextField!
    @IBOutlet var prayerMotivo: UIButton!
    @IBOutlet var send: UIButton!
    
    private let viewModel = PlayerViewModel()
    private var anyCancellable : [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscriptions()
        send.isEnabled = false
        
        playerName.addTarget(self, action: #selector(nameChanged), for: .editingChanged)
        playerEmail.addTarget(self, action: #selector(emailChanged), for: .editingChanged)
        playerWhatsapp.addTarget(self, action: #selector(whatsappChanged), for: .editingChanged)
        playerMensaje.addTarget(self, action: #selector(messageChanged), for: .editingChanged)
        
        let menuMotivo = { (action: UIAction) in
            self.update(number: action.title)
            self.viewModel.motiveChange(motive: action.title)
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
        
        send.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        playerName.delegate = self
        playerEmail.delegate = self
        playerWhatsapp.delegate = self
        playerMensaje.delegate = self
    
    }
 
    private func subscriptions() {
        viewModel.isDataValidState.sink { _ in } receiveValue: { isDataValid in
            if isDataValid {
                self.send.isEnabled = true
                self.send.backgroundColor = UIColor(named: "Tint Color")
            } else {
                self.send.isEnabled = false
                self.send.backgroundColor = UIColor(named: "Light Gray Color")
            }
        }.store(in: &anyCancellable)
        
        viewModel.nameError.sink { _ in } receiveValue: { nameError in
            self.setErrorNameState(value: nameError)
        }.store(in: &anyCancellable)
        
        viewModel.emailError.sink { _ in } receiveValue: { emailError in
            self.setErrorEmailState(value: emailError)
        }.store(in: &anyCancellable)
        
        viewModel.whatsappError.sink { _ in } receiveValue: { whatsappError in
            self.setErrorWhatsappState(value: whatsappError)
        }.store(in: &anyCancellable)
        
        viewModel.messageError.sink { _ in } receiveValue: { messageError in
            self.setErrorMessageState(value: messageError)
        }.store(in: &anyCancellable)
    }
    
    func setNavBarLogo() {
        let image = UIImage(named: "logo_blanco")!.withTintColor(UIColor(named: "on_background")!, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    func update(number:String) {
        if number == "option 1" {
            print("option 1 selected")
        }
    }
    
    @objc func nameChanged() {
        viewModel.nameChange(name: playerName.text! )
    }
    
    @objc func emailChanged() {
        viewModel.emailChange(email: playerEmail.text ?? "")
    }
    
    @objc func whatsappChanged() {
        viewModel.whatsappChange(whatsApp: playerWhatsapp.text ?? "")
    }
    
    @objc func messageChanged() {
        viewModel.messageChange(message: playerMensaje.text ?? "")
    }
    
    @objc func didTapButton() {
        if MFMailComposeViewController.canSendMail() {
            let vc = MFMailComposeViewController()
            vc.delegate = self
            vc.setSubject("Oracion")
            vc.setToRecipients(["alientodevida@alientodevida.mx"])
            vc.setMessageBody(viewModel.emailMessage, isHTML: false)
            present(vc, animated: true)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == playerName {
            playerEmail.becomeFirstResponder()
        } else if textField == playerEmail {
            playerWhatsapp.becomeFirstResponder()
        } else if textField == playerWhatsapp {
            playerMensaje.becomeFirstResponder()
        }
        return true
    }
    
    func setErrorNameState(value : String?) {
        if value == nil {
            self.errorName.text = ""
            self.errorName.isHidden = true
            self.constraint1.constant = 8
            self.playerName.layer.borderColor = UIColor.lightGray.cgColor
            self.playerName.layer.borderWidth = 0.15
            self.playerName.layer.cornerRadius = 5
        } else {
            self.errorName.text = value
            self.errorName.isHidden = false
            self.constraint1.constant = 28
            self.playerName.layer.borderWidth = 1
            self.playerName.layer.cornerRadius = 5
            self.playerName.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    func setErrorEmailState(value: String?) {
        if value == nil {
            self.errorEmail.text = ""
            self.errorEmail.isHidden = true
            self.constraint2.constant = 8
            self.playerEmail.layer.borderWidth = 0.15
            self.playerEmail.layer.cornerRadius = 5
            self.playerEmail.layer.borderColor = UIColor.lightGray.cgColor
        } else {
            self.errorEmail.text = value
            self.errorEmail.isHidden = false
            self.constraint2.constant = 28
            self.playerEmail.layer.borderColor = UIColor.red.cgColor
            self.playerEmail.layer.borderWidth = 1
            self.playerEmail.layer.cornerRadius = 5
        }
    }
    
    func setErrorWhatsappState(value: String?) {
        if value == nil {
            self.errorWhatsapp.text = ""
            self.errorWhatsapp.isHidden = true
            self.constraint3.constant = 8
            self.playerWhatsapp.layer.borderWidth = 0.15
            self.playerWhatsapp.layer.cornerRadius = 5
            self.playerWhatsapp.layer.borderColor = UIColor.lightGray.cgColor
        } else {
            self.errorWhatsapp.text = value
            self.errorWhatsapp.isHidden = false
            self.constraint3.constant = 28
            self.playerWhatsapp.layer.borderColor = UIColor.red.cgColor
            self.playerWhatsapp.layer.borderWidth = 1
            self.playerWhatsapp.layer.cornerRadius = 5
        }
    }
    
    func setErrorMessageState(value: String?) {
        if value == nil {
            self.errorMessage.text = ""
            self.errorMessage.isHidden = true
            self.constraint4.constant = 8
            self.playerMensaje.layer.borderWidth = 0.15
            self.playerMensaje.layer.cornerRadius = 5
            self.playerMensaje.layer.borderColor = UIColor.lightGray.cgColor
        } else {
            self.errorMessage.text = value
            self.errorMessage.isHidden = false
            self.constraint4.constant = 28
            self.playerMensaje.layer.borderColor = UIColor.red.cgColor
            self.playerMensaje.layer.borderWidth = 1
            self.playerMensaje.layer.cornerRadius = 5
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


/*
 let alert = UIAlertController(title:"¡Atención!" , message: isNameError, preferredStyle: UIAlertController.Style.alert)
 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
 self.present(alert, animated: true, completion: nil)
 */
