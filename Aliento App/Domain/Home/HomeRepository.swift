//
//  HomeApi.swift
//  Aliento App
//
//  Created by Pedro Antonio on 17/01/23.
//

import Foundation

protocol HomeRepository {
    func getHome(completion: @escaping (Result<HomeModel, ApiError>) -> Void)
}
