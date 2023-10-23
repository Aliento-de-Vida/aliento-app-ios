//
//  PlayerRepository.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 12/10/23.
//

import Foundation

protocol PlayerRepository {
    func getPlayer(completion: @escaping (Result<[PlayerModel], ApiError>) -> Void)
}

