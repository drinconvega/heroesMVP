//
//  BaseWebService.swift
//  HeroesMVP
//
//  Created by Daniel Rincon on 19/02/2021.
//

import Foundation
import NetworkReachability
import Alamofire

public class BaseWebService {
    
    public init() {}
    
    private static let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
    private static let privateKey = Bundle.main.object(forInfoDictionaryKey: "PRIV_KEY") as! String
    
    public var MAX_RETRY = 3
    //Para que acepte el servidor
    static let instance = BaseWebService()
    public static var manager: Alamofire.SessionManager = {
        
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 100
        configuration.timeoutIntervalForResource = 100
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let manager = Alamofire.SessionManager(
            configuration: configuration
        )
        
        return manager
    }()
    
    class func isConnected() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    static func getSecurityParams() -> [String: String]{
        var parameters = [String: String]()
        let timestamp = String(Date().timeIntervalSince1970)
        
        let hash = String.MD5(string: (timestamp + privateKey + apiKey))
        
        parameters["apikey"] = apiKey
        parameters["ts"] = timestamp
        parameters["hash"] = hash
        
        return parameters
    }
}
