//
//  URLRequestConvertible.swift
//  NetworkKit
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation

public protocol AppRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var queries: [String: Any]? { get }
    var headers: [String: String]? { get }
}
