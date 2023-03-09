//
//  Sermon.swift
//  Aliento App
//
//  Created by Pedro Antonio on 09/11/22.
//

import Foundation

struct AudioModelPresentation {
    let uri : String
    let releaseDate: String
    let title: String
    let subtitle: String
    let duration: String
    let imageUrl: String
}

extension AudioModel {
    func toPresentation() -> AudioModelPresentation {
        return AudioModelPresentation(
            uri: self.title,
            releaseDate: self.releaseDate.format(inputFormat: "yyyy-MM-dd", outputFormat: "d MMMM yyyy") ?? self.releaseDate,
            title: self.title,
            subtitle: self.subtitle,
            duration: "\(self.duration.msToMinutes()) min",
            imageUrl: self.imageUrl
        )
    }
}





