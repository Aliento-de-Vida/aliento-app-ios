//
//  HomeRepository.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation

class HomeRepository {
    static func getHome(completion: @escaping (Result<HomeModel, ApiError>) -> Void) {
        HomeApi.getHome(completion: completion)
    }
}
