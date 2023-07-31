//
//  CampusRepositoryImpl.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/02/23.
//

import Foundation

class CampusRepositoryImpl : CampusRepository {
    private let campusApi : CampusApi
    
    init(campusApi : CampusApi) {
        self.campusApi = campusApi
    }
    
    func getCampus(completion: @escaping (Result<[CampusModel], ApiError>) -> Void) {
                campusApi.getCampus { result in
                switch result {
                case.success(let response):
                    completion(.success(response.map { value in value.toDomain() }))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
