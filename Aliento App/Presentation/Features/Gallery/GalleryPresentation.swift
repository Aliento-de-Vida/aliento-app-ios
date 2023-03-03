//
//  GalleryPresentation.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 01/03/23.
//

import Foundation

struct GalleryPresentation {
    let id: Int
    let name: String
    let coverPicture: String
    let images: [String]
}

extension GalleryModel {
    func toPresentation() -> GalleryPresentation {
        return GalleryPresentation(
            id: self.id,
            name: self.name,
            coverPicture: self.coverPicture.toImageUrl(),
            images: self.images
        )
    }
}
