//
//  YoutubeApi.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 02/03/23.
//

import Foundation
import Alamofire

struct VideoApi {
    private let YOUTUBE_DEVELOPER_KEY = "AIzaSyD3-lHPYrGTHPUEP_ZpdQEPwx2IXKfznj0"
    
    private let apiManager : APIManager
    
    init(apiManager : APIManager) {
        self.apiManager = apiManager
    }
    
    func getVideo(
        playlistId: String,
        maxResults: Int,
        completion: @escaping(Result<VideoModelData, ApiError>) -> Void
    ) {
        let url = "https://www.googleapis.com/youtube/v3/playlistItems?" +
        "key=\(YOUTUBE_DEVELOPER_KEY)" +
        "&playlistId=\(playlistId)" +
        "&part=snippet" +
        "&order=date" +
        "&maxResults=\(maxResults)"
        
        let request = Request(method: .get, url: url)
        apiManager.request(urlRequest: request) { (result: Swift.Result<VideoModelData, ApiError>) in completion(result)
            
        }
    }
}
