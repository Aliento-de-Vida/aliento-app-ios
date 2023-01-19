//
//  FileRepositoryImpl.swift
//  Aliento App
//
//  Created by Pedro Antonio on 19/01/23.
//

import Foundation

class FileRepositoryImpl: FileRepository {
    
    private let fileApi: FileApi

    init(fileApi: FileApi) {
        self.fileApi = fileApi
    }

    func getAllImages() async throws -> [String] {
        return try await withCheckedThrowingContinuation { continuation in
            getAllImages { result in continuation.resume(with: result) }
        }
    }
    
    func getAllImages(
        completion: @escaping (Result<[String], ApiError>) -> Void
    ) {
        fileApi.getAllImages { (result: Swift.Result<[String], ApiError>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
