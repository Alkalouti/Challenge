//
//  RemoteDataSource.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import NetworkKit
import Combine

protocol RemoteDataSource {
    func getMovies(request: MovieListRequest) -> AnyPublisher<MoviesListResponse, AppError>
    func getMovieDetails(request: MovieDetailsRequest) -> AnyPublisher<MovieDetailsResponse, AppError>
}
