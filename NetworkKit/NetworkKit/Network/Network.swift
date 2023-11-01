//
//  Network.swift
//  NetworkKit
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation

struct Request {
    
    static func makeURLRequest(_ request: AppRequestConvertible) throws -> URLRequest {

        guard let baseUrl = URL(string: NetworkKit.enviroment.url) else {
            throw AppError.internalError(AppError.makeError(InternalError.invalidUrl))
        }
        var items = [URLQueryItem]()
        if let queries = request.queries {
            for (key, value) in queries {
                items.append(URLQueryItem(name: key, value: "\(value)"))
            }
        }
        
        var fullURL = baseUrl.appendingPathComponent(request.path)
        fullURL.append(queryItems: items)
        var urlRequest = URLRequest(url:fullURL)
        urlRequest.httpMethod = request.method.rawValue
        
        handleHeader(request, &urlRequest)
        
        // Parameters
        if let parameters = request.parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        if NetworkKit.isLoggerActive {
            print(urlRequest.cURL(pretty: false))
        }
        return urlRequest
    }

   
    private static func handleHeader(_ request: AppRequestConvertible, _ urlRequest: inout URLRequest) {
        var header =  ["Content-Type": "application/json",
                       "Authorization" : "Bearer " + NetworkKit.authorizedKey]
        if let headers = request.headers {
            for (key, value) in headers {
                header[key] = value
            }
        }
        urlRequest.allHTTPHeaderFields = header
    }

}
