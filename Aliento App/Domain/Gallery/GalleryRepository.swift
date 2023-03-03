//
//  GalleryRepository.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 01/03/23.
//

import Foundation

protocol GalleryRepository {
    func getGallery(completion: @escaping (Result<[GalleryModel], ApiError>) -> Void)
}

