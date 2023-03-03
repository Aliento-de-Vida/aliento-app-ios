//
//  GalleryModelData.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 01/03/23.
//

import Foundation

struct GalleryModelData : Codable {
    let id: Int
    let name: String
    let coverPicture: String
    let images: [Image]
}

struct Image : Codable {
    let name : String
}

extension GalleryModelData {
    func toDomain() -> GalleryModel {
        return GalleryModel(
            id: self.id,
            name: self.name,
            coverPicture: self.coverPicture,
            images: self.images.map { image in image.name }
        )
    }
}
