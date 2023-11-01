//
// MoviesRepository.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import Combine
import NetworkKit

final class MoviesRepositoryImpl: MoviesRepository {
    
    var remoteDataSource: RemoteDataSource!
    var mapper: MovieMapper!

    init(remoteDataSource: RemoteDataSource, mapper: MovieMapper) {
        self.remoteDataSource = remoteDataSource
        self.mapper = mapper
    }
    
    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getMovies(request: MovieListRequest) -> AnyPublisher<[Movie], AppError> {
        return self.remoteDataSource.getMovies(request: request)
            .map { [weak self] in
                guard let self = self else { return [] }
                return self.mapper.map(movies: $0.results)
            }
            .eraseToAnyPublisher()
    }
    
    func getMovieDetails(request: MovieDetailsRequest) -> AnyPublisher<MovieDetails?, AppError> {
        return self.remoteDataSource.getMovieDetails(request: request)
            .map { [weak self] in
                return self?.mapper.map(details: $0)
            }
            .eraseToAnyPublisher()
    }
}
