//
//  Api.swift
//  Aliento App
//
//  Created by Pedro Antonio Góngora Sepúlveda on 16/09/22.
//

import Foundation
import Alamofire

public protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
    var jsonDecoder: JSONDecoder { get }
}

public extension APIConfiguration {
    var jsonDecoder: JSONDecoder {
        get {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            return jsonDecoder
        }
    }
}

public enum APIVersion: String {
    case v1 = "v1/"
}

public class APIManager {
    
    static public let shared = APIManager()
    
    static public let IS_PRODUCTION = true
        
    static var baseUrl: String {
        get { APIManager.IS_PRODUCTION ? "https://todoserver-peter.herokuapp.com/" : "https://todoserver-peter.herokuapp.com/" }
    }
    
    private var isConnected: Bool { return NetworkReachabilityManager()?.isReachable ?? false }
    
    public let sessionManager = Session(interceptor: RequestInterceptor())
    
    private init() {}
    
    public func request<T: Codable>(urlRequest: APIConfiguration, completion: @escaping (Swift.Result<T, ApiError>) -> Void) {
        if !isConnected {
            completion(.failure(.notInternetConection))
        } else {
            sessionManager.request(urlRequest).validate().responseData { [weak self] (response) in
                guard let self = self else { return }
                #if DEBUG
                self.printLogs(response)
                #endif
                switch response.result {
                case .success(let value):
                    guard value.count > 0 else {
                        if let emptyJson = "{}".data(using: .utf8), let decodedObject = try? urlRequest.jsonDecoder.decode(T.self, from: emptyJson) {
                            completion(.success(decodedObject))
                        }
                        return
                    }
                    do {
                        let decodedObject = try urlRequest.jsonDecoder.decode(T.self, from: value)
                        completion(.success(decodedObject))
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
                                if let data = response.data {
                                    do {
                                        let genericError = try urlRequest.jsonDecoder.decode(ApiDefinedError.self, from: data)
                                        completion(.failure(.apiDefinedError(error: genericError)))
                                    } catch {
                                        completion(.failure(.badRequestData(data: data)))
                                    }
                                } else {
                                    completion(.failure(.badRequest))
                                }
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
