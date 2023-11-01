//
//  MovieAPI.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation
import NetworkKit

enum MovieAPI: AppRequestConvertible {
    case getMovieList(_ request: MovieListRequest)
    case getMovieDetails(_ request: MovieDetailsRequest)

    var method: HTTPMethod {
        switch self {
        case .getMovieList, .getMovieDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovieList:
            return "discover/movie"
        case .getMovieDetails(let request):
            return "movie/\(request.id)"
        }
    }
    
    var parameters: [String : Any]? {
        return nil
    }
    
    var queries: [String : Any]? {
        switch self {
        case .getMovieList(let request):
            return request.toDic()
        case .getMovieDetails(let request):
            return request.toDic()
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
