//
//  Request.swift
//  Aliento App
//
//  Created by Pedro Antonio on 24/02/23.
//

import Foundation
import Alamofire

public protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
    var headers: [Header] { get }
}

public struct Header {
    let name: String
    let value: String
}

struct Request: APIConfiguration {
    func asURLRequest() throws -> URLRequest {
        var urlRequest: URLRequest
        
        if (url != nil) {
            urlRequest = try URLRequest(url: url!, method: method)
        } else {
            urlRequest = try URLRequest(url: APIManager.baseUrl + APIVersion.v1.rawValue + path, method: method)
        }
        
        for header in headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.name)
        }
        
        urlRequest = try encoding.encode(urlRequest, with: parameters)
        return urlRequest
    }
    
    var method: HTTPMethod
    var headers: [Header] = []

    var url: String? = nil
    var path: String = ""
    
    var encoding: ParameterEncoding = URLEncoding.default
    var parameters: Parameters? = nil
}
