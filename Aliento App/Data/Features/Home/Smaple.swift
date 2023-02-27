//
//  Smaple.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 27/02/23.
//

/*import Foundation
import UIKit

struct Notification {
    let name: String
}

// Presentation
class NotificationsViewController: UIViewController {
    
    let notificationRespository: NotificationsRepository = NotificationsRepositoryOne()
    
    func getNotigications() {
        notificationRespository.getNotications(completion: { result ->
            switch result {
            case .success(list):
                
            case .failure(error)
                <#code#>
            }
        })
    }
}

// Domain
protocol NotificationsRepository {
    func getNotications(completion: @escaping () -> Result<[Notification], Error>)
}

// Data
class NotificationsRepositoryImpl: NotificationsRepository {
    let notificationsApi: NotificationsApi
    
    func getNotications(completion: @escaping () -> Result<[Notification], Error>) {
        notificationsApi.getNotications(completion: completion)
    }
}

class NotificationsApi {
    let apiManager: APIManager
    func getNotications(completion: @escaping () -> Result<[Notification], Error>) {
        let request = Request(method: .get, path: "notifications")
        apiManager.request(urlRequest: request, completion: completion)
    }
}


//class NotificationsRepositoryTwo: NotificationsRepository {
//    func getNotications(completion: @escaping () -> Result<[Notification], Error>) {
        
//    }
//}

 */
