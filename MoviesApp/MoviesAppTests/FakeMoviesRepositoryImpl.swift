//
//  FakeMoviesRepositoryImpl.swift
//  MoviesAppTests
//
//  Created by Ahmad Kalouti on 01/11/2023.
//

import Foundation
import Combine
import NetworkKit
@testable import MoviesApp

final class FakeEmptyMoviesRepositoryImpl: MoviesRepository {
    func getMovies(request: MovieListRequest) -> AnyPublisher<[Movie], AppError> {
        let arr: [Movie] = []
        return Result.Publisher(arr).eraseToAnyPublisher()
    }
}

final class FakeMoviesRepositoryImpl: MoviesRepository {
    func getMovies(request: MovieListRequest) -> AnyPublisher<[Movie], AppError> {
        let arr: [Movie] = [Movie(id: 0, originalTitle: "", posterPath: "", releaseDate: "")]
        return Result.Publisher(arr).eraseToAnyPublisher()
    }
}

final class FakeErrorMoviesRepositoryImpl: MoviesRepository {
    
    func getMovies(request: MovieListRequest) -> AnyPublisher<[Movie], AppError> {
        let error = NSError(domain: "com.test", code: 1, userInfo:[NSLocalizedDescriptionKey: "Error"])
        let appError = AppError.serverError(error)
        return Fail(error: appError).eraseToAnyPublisher()
    }
}

extension MoviesRepository {
    func getMovieDetails(request: MoviesApp.MovieDetailsRequest) -> AnyPublisher<MovieDetails?, AppError> {
        return Result.Publisher(nil).eraseToAnyPublisher()
    }
}
