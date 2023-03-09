//
//  AudioModelData.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 03/03/23.
//

import Foundation

struct AlbumsModelData : Codable {
    let href: String?
    let items: [Album]
}

struct Album : Codable {
    let uri: String
    let id: String
    let name: String?
    let releaseDate: String
    let duration: Int?
    let images: [SpotifyImage]?
}

struct SpotifyImage : Codable {
    let url: String?
}
