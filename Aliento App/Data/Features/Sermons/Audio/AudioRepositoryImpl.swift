//
//  AudioRepositoryImpl.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 03/03/23.
//

import Foundation
import Alamofire

class AudioRepositoryImpl : AudioRepository {
        
    private let audioApi : AudioApi
    
    init(audioApi : AudioApi) {
        self.audioApi = audioApi
    }
    
    func getTracks(
        artistId: String,
        completion: @escaping (Result<[AudioModel], ApiError>) -> Void
    ) {
        
        // Obtain Token
        audioApi.getToken { result in
            switch result {
            case .success(let token):
                let bearerToken = "\(token.tokenType) \(token.accessToken)"
                
                // Obtain Albums
                var audios: [AudioModel] = []
                self.getAlbums(token: bearerToken, artistId: artistId) { result in
                    switch result {
                    case .success(let albums):
                        
                        // For each album obtain tracks
                        var albumsCounter = 0
                        for album in albums {
                            
                            self.getTracks(token: bearerToken, albumId: album.id) { result in
                                switch result {
                                case .success(let response):
                                    for track in response {
                                        audios.append(track.toDomain(album: album))
                                    }
                                    albumsCounter = albumsCounter + 1
                                    
                                    // when we finished processing the last album we proceed
                                    if (albumsCounter == albums.capacity - 1) { completion(.success(audios)) }
                                    
                                case .failure(let error):
                                    completion(.failure(error))
                                }
                            }
                            
                        }
                        
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                            
            case .failure(let error):
                completion(.failure(error))
                
            }
            
        }
        
    }
    
    private func getAlbums(
        token : String,
        artistId : String,
        completion : @escaping (Result<[Album], ApiError>) -> Void
    ) {
        audioApi.getAlbums(
            token : token,
            artistId : artistId,
            completion: { result in
                switch result {
                case .success(let response):
                    completion(.success(response.items))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        )
    }
        
    private func getTracks(
        token : String,
        albumId : String,
        completion : @escaping (Result<[Track], ApiError>) -> Void
    ) {
        audioApi.getTracks(token : token, albumId : albumId) { result in
            switch result {
            case .success(let response):
                completion(.success(response.items))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
            
    
    
           
            
           
    }
                            

 

