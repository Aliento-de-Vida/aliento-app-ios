//
//  Int.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 07/03/23.
//

import Foundation

extension Int {
    
    func msToSeconds() -> Int {
        return (self / 1000)
    }
    
    func secondsToMinutes() -> Int {
        return (self / 60)
    }
    
    func msToMinutes() -> Int {
        return self.msToSeconds().secondsToMinutes()
    }
    
}




