//
//  Notifications.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 19/01/23.
//

import Foundation

struct NotificationPresentation {
    let imageUrl: String
    let title: String
    let phrase: String
    let date: String
}

extension NotificationModel {
    func toPresentation() -> NotificationPresentation {
        return NotificationPresentation(
            imageUrl: self.imageUrl.toImageUrl(),
            title: self.tittle,
            phrase: self.phrase,
            date: self.date
        )
    }
}
