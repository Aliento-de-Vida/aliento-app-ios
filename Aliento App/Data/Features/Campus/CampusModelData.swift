//
//  CampusModelData.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/02/23.
//

import Foundation

struct CampusModelData : Codable {
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

struct Location : Codable {
    let latitude: String
    let longitude: String
}

extension CampusModelData {
    func toDomain() -> CampusModel {
        return CampusModel(id: self.id, name: self.name, description: self.description, shortDescription: self.shortDescription, imageUrl: self.imageUrl, videoUrl: self.videoUrl, location: self.location, images: self.images, contact: self.contact)
    }
}

