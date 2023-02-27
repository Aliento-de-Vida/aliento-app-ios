//
//  HomeRepository.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation

class HomeRepositoryImpl: HomeRepository {
    private let homeApi: HomeApi
    private let fileRepository: FileRepository
    
    init(homeApi: HomeApi, fileRepository: FileRepository) {
        self.homeApi = homeApi
        self.fileRepository = fileRepository
    }
    
    func getHome() async throws -> HomeModel {
        return try await withCheckedThrowingContinuation { continuation in
            getHome { result in continuation.resume(with: result) }
        }
    }
    
    func getHome(
        completion: @escaping (Result<HomeModel, ApiError>) -> Void
    ) {
        homeApi.getHome(completion: { (result: Swift.Result<HomeModelData, ApiError>) in
            switch result {
            case .success(let response):
                completion(.success(response.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func getHomeImages() async throws -> HomeImages {
        let images: [String] = try await fileRepository.getAllImages().map { (name: String) in
            return name.replacingOccurrences(of: "/uploads", with: "").toImageUrl()
        }
        
        let sermonImage = images.last { name in name.contains(HomeImages.SERMONS_IMAGE) }
        let churchImage = images.last { name in name.contains(HomeImages.CHURCH_IMAGE) }
        let campusImage = images.last { name in name.contains(HomeImages.CAMPUS_IMAGE) }
        let galleriesImage = images.last { name in name.contains(HomeImages.GALLERY_IMAGE) }
        let donationsImage = images.last { name in name.contains(HomeImages.DONATIONS_IMAGE) }
        let prayerImage = images.last { name in name.contains(HomeImages.PRAYER_IMAGE) }
        let ebookImage = images.last { name in name.contains(HomeImages.EBOOK_IMAGE) }
        
        return HomeImages(
            sermonsImage: sermonImage,
            churchImage: churchImage,
            campusImage: campusImage,
            galleriesImage: galleriesImage,
            donationsImage: donationsImage,
            prayerImage: prayerImage,
            ebookImage: ebookImage
        )
    }
}
