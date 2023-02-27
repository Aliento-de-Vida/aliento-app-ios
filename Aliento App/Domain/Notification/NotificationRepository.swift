//
//  NotificationRepository.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 27/02/23.
//

import Foundation

protocol NotificationRepository {
    func getNotification(completion: @escaping (Result<[NotificationModel], ApiError>) -> Void)
}
