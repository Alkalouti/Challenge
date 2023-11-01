//
//  APIResult.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import NetworkKit

struct APIResult<T:Encodable>  {

    enum HandlerStatus: Identifiable {
        var id: Int {
            get {
                hashValue
            }
        }
        case loading
        case success
        case failure
    }

    let data : T?
    let error :AppError?
    let status :HandlerStatus

    init(data: T?, error: AppError? = nil, status: HandlerStatus) {
        self.data = data
        self.error = error
        self.status = status
    }

    static func loading() ->APIResult<T>{
        return  APIResult( data:nil, error: nil, status: .loading)
    }

    static func failure(error:AppError) ->APIResult<T>{
        return  APIResult( data:nil, error: error, status: .failure)
    }

    static func success(result :T) ->APIResult<T>{
        return  APIResult( data:result, error: nil, status: .success)
    }
}
