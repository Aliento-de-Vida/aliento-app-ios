//
//  HomeApi.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation
import Alamofire

enum HomeRouter: APIConfiguration {
    case getHome

    var method: HTTPMethod {
        switch self {
        case .getHome:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getHome:
            return URLEncoding.default
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getHome:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .getHome:
            return "home"
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

struct HomeApi {
    private let apiManager: APIManager
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func getHome(completion: @escaping (Result<HomeModelData, ApiError>) -> Void) {
        apiManager.request(urlRequest: HomeRouter.getHome) { (result: Swift.Result<HomeModelData, ApiError>) in
            completion(result)
        }
    }
}
