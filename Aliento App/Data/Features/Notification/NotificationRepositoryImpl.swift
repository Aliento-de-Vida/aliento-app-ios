//
//  NotificationRepositoryImpl.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 27/02/23.
//

import Foundation

class NotificationRepositoryImpl : NotificationRepository {
    private let notificationApi : NotificationApi
    
    init(notificationApi : NotificationApi) {
        self.notificationApi = notificationApi
    }
    
    func getNotification(completion: @escaping (Result<[NotificationModel], ApiError>) -> Void) {
        notificationApi.getNotification { result in
            switch result {
                case.success(let response):
                completion(.success(response.map { value in value.toDomain() }))
                case .failure(let error):
                completion(.failure(error))
            }
        }

    }
    
}
