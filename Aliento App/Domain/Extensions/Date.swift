//
//  Date.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/02/23.
//

import Foundation

extension Date {
  
    func toString(format: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
