//
//  FileRepository.swift
//  Aliento App
//
//  Created by Pedro Antonio on 19/01/23.
//

import Foundation

protocol FileRepository {
    func getAllImages() async throws -> [String]
}
