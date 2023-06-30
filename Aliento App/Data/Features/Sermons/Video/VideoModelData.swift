//
//  YoutubeModelData.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 02/03/23.
//

import Foundation

struct VideoModelData : Codable {
    let items : [Items]
}

struct Items : Codable {
    let id : String
    let snippet : Snippet
}

struct ResourceId : Codable {
    let kind : String
    let videoId : String
}

struct Snippet : Codable {
    let publishedAt: String
    let title: String
    let description: String
    let thumbnails: Thumbnails
    let resourceId : ResourceId
}

struct Thumbnails : Codable {
    let standard : Standard?
}

struct Standard : Codable {
    let url : String
}

extension Items {
    func toDomain() -> VideoModel {
    return VideoModel(
        id: self.id,
        videoId: self.snippet.resourceId.videoId,
        description: self.snippet.description,
        title: self.snippet.title,
        date: self.snippet.publishedAt,
        thumbnulsUrl: self.snippet.thumbnails.standard?.url
    )
    }
    
}
