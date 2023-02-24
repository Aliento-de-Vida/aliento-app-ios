//
//  FileApi.swift
//  Aliento App
//
//  Created by Pedro Antonio on 19/01/23.
//

import Foundation
import Alamofire

struct FileApi {
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getAllImages(completion: @escaping (Result<[String], ApiError>) -> Void) {
        let request = Request(method: .get, path: "files")
        apiManager.request(urlRequest: request) { (result: Swift.Result<[String], ApiError>) in
            completion(result)
        }
    }
}
