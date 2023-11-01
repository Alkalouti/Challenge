//
//  InternalError.swift
//  NetworkKit
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation

public typealias ErrorData = (code: Int, message: String)

struct InternalError {
    static let invalidUrl: ErrorData = (code: 1000, message: "Invalid URL Request")
}
