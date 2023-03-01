//
//  CampusPresentation.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/02/23.
//

import Foundation


struct CampusPresentation {
    let id: Int
    let name: String
    let description: String
    let shortDescription: String
    let imageUrl: String
    let videoUrl: String
    let location: Location
    let images: [String]
    let contact: String
}

extension CampusModel {
    func toPresentation() -> CampusPresentation {
        return CampusPresentation(
            id: self.id,
            name: self.name,
            description: self.description,
            shortDescription: self.description,
            imageUrl: self.imageUrl.toImageUrl(),
            videoUrl: self.videoUrl,
            location: self.location,
            images: self.images,
            contact: self.contact
        )
    }
}
