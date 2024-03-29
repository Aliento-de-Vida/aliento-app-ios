//
//  Api.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation
import Alamofire

public enum APIVersion: String {
    case v1 = "v1/"
}

public class APIManager {
    let sessionManager: Session
    lazy var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()

    init(sessionManager: Session) {
        self.sessionManager = sessionManager
    }
    
    static public let IS_PRODUCTION = true
        
    static var baseUrl: String {
        get { APIManager.IS_PRODUCTION ? "https://todoserver-peter.herokuapp.com/" : "https://todoserver-peter.herokuapp.com/" }
    }
    
    private var isConnected: Bool { return NetworkReachabilityManager()?.isReachable ?? false }
    
    public func request<T: Codable>(urlRequest: APIConfiguration, completion: @escaping (Result<T, ApiError>) -> Void) {
        if !isConnected {
            completion(.failure(.notInternetConection))
            return
        }
            
        sessionManager.request(urlRequest).validate().responseData { [weak self] (response) in
            guard let self = self else { return }
            
            #if DEBUG
            self.printLogs(response)
            #endif
            
            switch response.result {
            case .success(let value):
                do {
                    let response: T = try self.parseResult(jsonDecoder: self.jsonDecoder, value: value)
                    completion(.success(response))
                } catch {
                    #if DEBUG
                    print("JSON decode error: \(error)")
                    #endif
                    completion(.failure(ApiError.jsonDecodingError))
                }
                
            case .failure(let afError):
                // MARK: - Alamofire error
                switch afError {
                case .responseValidationFailed(let reason):
                    switch reason {
                    case .unacceptableStatusCode(let code):
                        switch code {
                        case 100...199: // Informational - Request received, continuing process
                            completion(.failure(.serverError(error: "code 100...199")))
                        case 300...399: // Redirection - Further action must be taken in order to complete the request
                            completion(.failure(.serverError(error: "code 300...399")))
                        case 400...499: // Client Error - The request contains bad syntax or cannot be fulfilled
                            completion(.failure(.serverError(error: "code 400...499")))
                        case 500...599: // Server Error - The server failed to fulfill an apparently valid request
                            completion(.failure(.serverError(error: "code 500...599")))
                        default:
                            completion(.failure(.serverError(error: "server")))
                        }
                    default:
                        completion(.failure(.serverError(error: "server error")))
                    }
                default:
                    break
                }
            }
        }
    }
    
    private func parseResult<T: Codable>(jsonDecoder: JSONDecoder, value: Data) throws -> T {
        var data = "{}".data(using: .utf8)
        if value.count > 0 {
            data = value
        }
        
        let decodedObject = try jsonDecoder.decode(T.self, from: data!)
        return decodedObject
    }
    
    // MARK: - Private
    private func hasInternetConection(_ error: URLError) -> Bool {
        switch error.code {
        case .notConnectedToInternet, .cannotConnectToHost, .networkConnectionLost, .timedOut:
            return false
        default:
            return true
        }
    }
    
    private func printLogs(_ response: AFDataResponse<Data>) {
        #if DEBUG
        if let request = response.request, let httpBody = request.httpBody, let requestParameters = String(data: httpBody, encoding: .utf8) {
            print("[Request][Parameters] \(requestParameters)")
        }
        debugPrint(response)
        if let data = response.data, let returnData = String(data: data, encoding: .utf8) {
            print("[Response][Result]: \(returnData)")
        }
        #endif
    }
}
