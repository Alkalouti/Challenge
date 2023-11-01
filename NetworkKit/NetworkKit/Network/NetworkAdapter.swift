//
//  NetworkAdapter.swift
//  NetworkKit
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation
import Combine

public class NetworkAdapter {
    
    // Request with Decoding the result
    public static func request<T: Decodable>(router: AppRequestConvertible,
                                      type: T.Type) -> AnyPublisher<T, AppError> {
        do {
            let request = try Request.makeURLRequest(router)
            return URLSession.shared
                .dataTaskPublisher(for: request) // 3
                .tryMap { result -> Data in
                    if NetworkKit.isLoggerActive {
                        print(String(data: result.data, encoding: .utf8) ?? "")
                    }
                    return result.data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError({ error in
                    return AppError.serverError(error)
                })
                .eraseToAnyPublisher()
        } catch let error {
            return Fail(error: error as! AppError).eraseToAnyPublisher()
        }
    }
}
