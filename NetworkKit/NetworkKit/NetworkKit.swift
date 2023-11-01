//
//  NetworkKit.swift
//  NetworkKit
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation

public class NetworkKit: NSObject {
    
    static var authorizedKey: String = ""
    static var enviroment: Enviroment!
    internal static var isLoggerActive: Bool!

    /**
     Setup a shared vslues in order to using them while calling the tokanize endpoints.
     - Parameter enviroment: The object carries the api env  (such as Staging and Production).
     - Parameter authorizedKey: An String value,  authenticate to use the api.
     - Parameter isLoggerActive: a Boolean value determing whether response body data should be logged.

     This func is mandatory for setup network
     */
         
    public static func setup(with enviroment: Enviroment, authorizedKey: String, isLoggerActive: Bool = false) {
        NetworkKit.enviroment = enviroment
        NetworkKit.authorizedKey = authorizedKey
        NetworkKit.isLoggerActive = isLoggerActive
    }
    
    /// Update
    /// - Parameter key: <#key description#>
    public static func updateAuthorizedKey(key: String) {
        NetworkKit.authorizedKey = key
    }
}
