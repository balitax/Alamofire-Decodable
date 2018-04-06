//
//  APIManager.swift
//  Codablex
//
//  Created by Agus Cahyono on 06/04/18.
//  Copyright © 2018 Agus Cahyono. All rights reserved.
//

import Foundation
import Alamofire

struct APIManager {
    
    static var manager: SessionManager!
    
    
    /// GET FROM API
    ///
    /// - Parameters:
    ///   - url: URL API
    ///   - method: methods
    ///   - parameters: parameters
    ///   - encoding: encoding
    ///   - headers: headers
    ///   - completion: completion
    ///   - failure: failure
    static func getFrom(_ url: String, method: HTTPMethod, parameters: Parameters, encoding: ParameterEncoding, headers: HTTPHeaders, completion: @escaping (_ response: Data) ->(), failure: @escaping (_ error: String) -> ()) {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        manager = Alamofire.SessionManager(configuration: configuration)
        
        manager.request(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers).responseString(
                queue: DispatchQueue.main,
                encoding: String.Encoding.utf8) { response in
                    
                    if response.response?.statusCode == 200 {
                        guard let callback = response.data else {
                            failure(self.generateRandomError())
                            return
                        }
                        
                        completion(callback)
                        
                    } else {
                        guard let callbackError = response.result.value else {
                            failure(self.generateRandomError())
                            return
                        }
                        failure(callbackError)
                    }
                    
        }
        
    }
    
    
    /// GENERATE RANDOM ERROR
    ///
    /// - Returns: string error randoms
    static func generateRandomError() -> String {
        return "Oops. Please reload again."
    }
    
}
