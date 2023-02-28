//
//  String.swift
//  Aliento App
//
//  Created by Pedro Antonio on 19/01/23.
//

import Foundation

extension String {
    func toImageUrl() -> String {
        return "https://todoserver-peter.herokuapp.com/v1/files/\(self)"
    }
    
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
    func format(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss'Z'", outputFormat : String = "dd MMM yyyy") -> String? {
        return self.toDate(format: inputFormat)?.toString(format: outputFormat)
    }
}
