//
//  GalleryRepositoryImpl.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 01/03/23.
//

import Foundation

class GalleryRepositoryImpl : GalleryRepository {
    private let galleryApi : GalleryApi
    
    init(galleryApi : GalleryApi) {
        self.galleryApi = galleryApi
    }
    
    func getGallery(
        completion: @escaping (Result<[GalleryModel], ApiError>) -> Void
    ) {
        galleryApi.getGallery { result in
            switch result {
            case.success(let response):
                completion(.success(response.map { value in value.toDomain() }))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }

}
