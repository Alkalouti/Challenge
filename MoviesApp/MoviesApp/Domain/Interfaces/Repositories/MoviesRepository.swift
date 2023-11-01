//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import Combine
import NetworkKit

protocol MoviesRepository {
    func getMovies(request: MovieListRequest) -> AnyPublisher<[Movie], AppError>
    func getMovieDetails(request: MovieDetailsRequest) -> AnyPublisher<MovieDetails?, AppError>
}
