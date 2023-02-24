//
//  HomeApi.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation
import Alamofire

struct HomeApi {
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getHome(completion: @escaping (Result<HomeModelData, ApiError>) -> Void) {
        let request = Request(method: .get, path: "home")
        apiManager.request(urlRequest: request) { (result: Swift.Result<HomeModelData, ApiError>) in
            completion(result)
        }
    }
    
}
