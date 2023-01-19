//
//  String.swift
//  Aliento App
//
//  Created by Pedro Antonio on 19/01/23.
//

import Foundation

extension String {
    func toImageUrl() -> String {
        return "https://todoserver-peter.herokuapp.com/v1/files\(self)"
    }
}


