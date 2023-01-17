//
//  HomeRepository.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation

class HomeRepositoryImpl: HomeRepository {
    private let homeApi: HomeApi

    init(homeApi: HomeApi) {
        self.homeApi = homeApi
    }

    func getHome(
        completion: @escaping (Result<HomeModel, ApiError>) -> Void
    ) {
        homeApi.getHome { (result: Swift.Result<HomeModelData, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success(response.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }    
}
