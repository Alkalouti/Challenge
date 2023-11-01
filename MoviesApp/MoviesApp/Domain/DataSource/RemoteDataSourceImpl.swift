//
//  RemoteDataSourceImpl.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import Combine
import NetworkKit

final class RemoteDataSourceImpl: RemoteDataSource {
    func getMovies(request: MovieListRequest) -> AnyPublisher<MoviesListResponse, AppError> {
        return NetworkAdapter.request(router: MovieAPI.getMovieList(request), type: MoviesListResponse.self)
    }
    
    func getMovieDetails(request: MovieDetailsRequest) -> AnyPublisher<MovieDetailsResponse, AppError> {
        return NetworkAdapter.request(router: MovieAPI.getMovieDetails(request), type: MovieDetailsResponse.self)
    }
}
