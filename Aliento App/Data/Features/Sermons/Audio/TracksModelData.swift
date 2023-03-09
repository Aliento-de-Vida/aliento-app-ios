//
//  TracksModelData.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 06/03/23.
//

import Foundation

struct TracksModelData : Codable {
    let href : String?
    let items : [Track]
}

struct Track: Codable {
    let uri: String
    let name: String
    let durationMs : Int?
    let images: [SpotifyImage]?
}

extension Track {
    func toDomain(album: Album) -> AudioModel {
    return AudioModel(
        uri: self.uri,
        releaseDate: album.releaseDate,
        title: self.name,
        subtitle: album.name ?? "",
        duration: self.durationMs ?? 0,
        imageUrl: album.images?.first?.url ?? ""
    )
    }
}


