//
//  AudioRepository.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 03/03/23.
//

import Foundation
    
protocol AudioRepository {
    func getTracks(
        artistId: String,
        completion : @escaping(Result<[AudioModel], ApiError>) -> Void
    )
}

    

