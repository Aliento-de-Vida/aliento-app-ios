//
//  AppModule.swift
//  Aliento App
//
//  Created by Pedro Antonio on 17/01/23.
//

import Foundation
import Alamofire
import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        register { RequestInterceptor() }.implements(Alamofire.RequestInterceptor.self)
        register { Session(interceptor: optional()) }
        register { APIManager(sessionManager: resolve()) }
        
        register { HomeApi(apiManager: resolve()) }
        register { HomeRepositoryImpl(homeApi: resolve(), fileRepository: resolve()) }.implements(HomeRepository.self)
        register { FileApi(apiManager: resolve()) }
        register { FileRepositoryImpl(fileApi: resolve()) }.implements(FileRepository.self)
        
        register { NotificationApi(apiManager: resolve()) }
        register { NotificationRepositoryImpl(notificationApi: resolve()) }.implements(NotificationRepository.self)
    }
    
}
