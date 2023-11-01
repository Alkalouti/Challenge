//
//  AppError.swift
//  NetworkKit
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation

public let appNetworkDomain = "com.yassir.networkLayer"

public enum AppError: Error {
    case timeOut(Error?)
    case noInternet(Error?)
    case serverError(Error?)
    case internalError(Error?)

    public var errorDescription: String? {
        switch self {
        case .timeOut(let error):
            return error?.localizedDescription
        case .noInternet(let error):
            return error?.localizedDescription
        case .internalError(let error):
            return error?.localizedDescription
        case .serverError(let error):
            return error?.localizedDescription
        }
    }
    
    public var errorCode: Int? {
        switch self {
        case .timeOut(let error):
            return (error as NSError?)?.code
        case .noInternet(let error):
            return (error as NSError?)?.code
        case .internalError(let error):
            return (error as NSError?)?.code
        case .serverError(let error):
            return (error as NSError?)?.code
        }
    }
    
    public static func makeError(_ errorData: ErrorData) -> AppError {
        let error = NSError(domain: appNetworkDomain, code: errorData.code, userInfo:[NSLocalizedDescriptionKey: errorData.message])
        return AppError.internalError(error)
    }
}
