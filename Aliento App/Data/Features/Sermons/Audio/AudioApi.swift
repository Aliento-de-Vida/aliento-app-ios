//
//  AudioApi.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 03/03/23.
//

import Foundation
import Alamofire

struct AudioApi {
    private let apiManager : APIManager
    private let spotifyBaseUrl = "https://api.spotify.com"
    
    init(apiManager : APIManager) {
        self.apiManager = apiManager
    }
    
    func getAlbums(
        token : String,
        artistId : String,
        completion: @escaping(Result<AlbumsModelData, ApiError>) -> Void
    ) {
        let header = Header(name: "Authorization", value: token)
        let request = Request(method: .get, headers: [header], url: "\(spotifyBaseUrl)/v1/artists/\(artistId)/albums")
        apiManager.request(urlRequest: request) { (result: Swift.Result<AlbumsModelData, ApiError>) in
            completion(result)
        }
    }
    
    func getTracks(
        token : String,
        albumId : String,
        completion: @escaping(Result<TracksModelData, ApiError>) -> Void
    ) {
       let header = Header(name: "Authorization", value: token)
        let request = Request(method: .get, headers: [header],  url: "\(spotifyBaseUrl)/v1/albums/\(albumId)/tracks")
        apiManager.request(urlRequest: request) { (result: Swift.Result<TracksModelData, ApiError>) in
            completion(result)
        }
    }
    
    func getToken(
        completion: @escaping(Result<TokenModelData, ApiError>) -> Void
    ) {
        let header = Header(name: "Authorization", value: Bundle.main.object(forInfoDictionaryKey: "SPOTIFY_API_KEY") as! String)
        let parameters = ["grant_type": "client_credentials"]
        let request = Request(
            method: .post,
            headers: [header],
            url: "https://accounts.spotify.com/api/token",
            encoding: URLEncoding.default,
            parameters: parameters
        )
        apiManager.request(urlRequest: request) { (result: Swift.Result<TokenModelData, ApiError>) in
            completion(result)
        }
    }
    
}
