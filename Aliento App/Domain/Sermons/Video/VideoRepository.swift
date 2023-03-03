//
//  YouTubeRepository.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 02/03/23.
//

import Foundation

protocol VideoRepository {
    func getVideo(
        playlistId: String,
        maxResults: Int,
        completion : @escaping(Result<[VideoModel], ApiError>) -> Void
    )
}
