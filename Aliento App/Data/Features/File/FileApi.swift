//
//  FileApi.swift
//  Aliento App
//
//  Created by Pedro Antonio on 19/01/23.
//

import Foundation
import Alamofire

enum FileRouter: APIConfiguration {
    case getAllImages

    var method: HTTPMethod {
        switch self {
        case .getAllImages:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getAllImages:
            return URLEncoding.default
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getAllImages:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .getAllImages:
            return "files"
        }
    }
    
    // MARK: URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var urlRequest = try URLRequest(url: APIManager.baseUrl + APIVersion.v1.rawValue + path, method: method)
        urlRequest = try encoding.encode(urlRequest, with: parameters)
        print(urlRequest)
        
        return urlRequest
    }
}

struct FileApi {
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getAllImages(completion: @escaping (Result<[String], ApiError>) -> Void) {
        apiManager.request(urlRequest: FileRouter.getAllImages) { (result: Swift.Result<[String], ApiError>) in
            completion(result)
        }
    }
}
