//
//  CampusApi.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/02/23.
//

import Foundation
import Alamofire

struct CampusApi {
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getCampus(completion: @escaping (Result<[CampusModelData], ApiError>) -> Void) {
        let request = Request(method: .get, path: "campuses")
        apiManager.request(urlRequest: request) { (result: Swift.Result<[CampusModelData], ApiError>) in completion(result)
        }
    }
}

