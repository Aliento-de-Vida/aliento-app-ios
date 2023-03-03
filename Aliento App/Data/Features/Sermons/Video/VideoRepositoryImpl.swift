//
//  File.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 02/03/23.
//

import Foundation

class VideoRepositoryImpl : VideoRepository {
    private let videoApi : VideoApi
    
    init(videoApi : VideoApi) {
        self.videoApi = videoApi
    }
    func getVideo(
        playlistId: String,
        maxResults: Int,
        completion: @escaping (Result<[VideoModel], ApiError>) -> Void
    ) {
        videoApi.getVideo(playlistId: playlistId, maxResults: maxResults) { result in
            switch result {
            case.success(let response):
                completion(.success(response.items.map { value in value.toDomain() }))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
}
