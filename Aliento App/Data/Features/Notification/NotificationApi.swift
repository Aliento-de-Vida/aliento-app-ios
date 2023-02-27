//
//  NotificacionApi.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 27/02/23.
//

import Foundation
import Alamofire

struct NotificationApi {
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getNotification(completion: @escaping (Result<[NotificationModelData], ApiError>) -> Void) {
        let request = Request(method: .get, path: "notifications")
        apiManager.request(urlRequest: request) { (result: Swift.Result<[NotificationModelData], ApiError>) in completion(result)
        }
    }
}
