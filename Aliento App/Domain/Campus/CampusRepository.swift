//
//  CampusRepository.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 28/02/23.
//

import Foundation

protocol CampusRepository {
    func getCampus(completion: @escaping (Result<[CampusModel], ApiError>) -> Void)
}
