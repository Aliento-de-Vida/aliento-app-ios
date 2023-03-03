//
//  GalleryApi.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 01/03/23.
//

import Foundation
import Alamofire

struct GalleryApi {
    private let apiManager : APIManager
    
    init(apiManager : APIManager) {
        self.apiManager = apiManager
    }
    
    func getGallery(completion: @escaping(Result<[GalleryModelData], ApiError>) -> Void) {
        let request = Request(method: .get, path: "galleries")
        apiManager.request(urlRequest: request) { (result: Swift.Result<[GalleryModelData], ApiError>) in completion(result)
        }
    }
    
}
