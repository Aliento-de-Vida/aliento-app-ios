//
//  VideoSermon.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 10/01/23.
//

import Foundation

struct VideoModelPresentation {
    let id: String
    let videoId: String
    let description: String
    let title: String
    let date: String
    let thumbnulsUrl: String?
}

extension VideoModel {
    func toPresentation() -> VideoModelPresentation {
        return VideoModelPresentation(
            id: self.id,
            videoId: self.videoId,
            description: self.description,
            title: self.title,
            date: self.date.format() ?? "",
            thumbnulsUrl: self.thumbnulsUrl
        )
    }
}
