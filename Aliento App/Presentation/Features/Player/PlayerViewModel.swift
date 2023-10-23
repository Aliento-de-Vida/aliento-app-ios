//
//  PlayerViewModel.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 11/07/23.
//


import Foundation
import Resolver
import Combine
import UIKit

public class PlayerViewModel {
    
    init() {}
    
    // state
    var isDataValidState = PassthroughSubject <Bool, Error>()
    var emailMessage = ""
    var email = ""
    var nameError = PassthroughSubject <String?, Error>()
    var emailError = PassthroughSubject <String?, Error>()
    var whatsappError = PassthroughSubject <String?, Error>()
    var messageError = PassthroughSubject <String?, Error>()
    
    // events
    func nameChange(name: String) {
        userData.name = name
        if userData.name == nil || isNameValid() {
            self.nameError.send(nil)
        } else {
            self.nameError.send("Ingresa minimo 3 caracteres")
        }
        validateData()
    }
    
    func emailChange(email: String) {
        userData.email = email
        if userData.email == nil || isEmailValid() {
            self.emailError.send(nil)
        } else {
            self.emailError.send("Ingresa un email valido")
        }
        validateData()
    }
    
    func whatsappChange(whatsApp: String) {
        userData.whatsapp = whatsApp
        if userData.whatsapp == nil || isWhatsappValid() {
            self.whatsappError.send(nil)
        } else {
            self.whatsappError.send("Ingresa al menos 10 digitos")
        }
        validateData()
    }
    
    func messageChange(message: String) {
        userData.message = message
        if userData.message == nil || isMessageValid() {
            self.messageError.send(nil)
        } else {
            self.messageError.send("Ingresa al menos 10 caracteres")
        }
        validateData()
    }
    
    func motiveChange(motive: String) {
        userData.motive = motive
        let validation = isMotiveValid()
        validateData()
    }
    
    // private stuff
    private var userData = PlayerPresentation(name: nil, email: nil, whatsapp: nil, message: nil , motive: "")
    
    private func isNameValid() -> Bool {
        if userData.name == nil || userData.name!.count < 3 {
            return false
        }
        return true
    }
    
    private func isEmailValid() -> Bool {
        if userData.email == nil || !isValidEmailAddress(emailAddressString: userData.email!) {
            return false
        }
        return true
    }
    
    private func isWhatsappValid() -> Bool {
        if  userData.whatsapp == nil || userData.whatsapp!.count < 10 {
            return false
        }
        return true
    }
    
    private func isMessageValid() -> Bool {
        if userData.message == nil || userData.message!.count < 10 {
            return false
        }
        return true
    }
    
    private func isMotiveValid() -> Bool {
        if userData.motive.isEmpty || userData.motive == "Elige un motivo" {
            return false
        }
        return true
    }
    
    
    private func validateData() {
        if isNameValid() && isEmailValid() && isMessageValid() && isWhatsappValid() && isMotiveValid() {
            self.isDataValidState.send(true)
        } else {
            self.isDataValidState.send(false)
        }
        
        if userData.name != nil &&  userData.email != nil && userData.message != nil && userData.whatsapp != nil {
            emailMessage = "Hola buen día, mi nombre es \(userData.name!) y quisiera pedir oracion con motivo \(userData.motive), mi numero de telefono es \(userData.whatsapp!), el mensaje que quiero dejar seria el siguiente \(userData.message!), Gracias."
        }
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
}

struct PlayerPresentation {
    var name : String?
    var email : String?
    var whatsapp : String?
    var message : String?
    var motive : String
}

