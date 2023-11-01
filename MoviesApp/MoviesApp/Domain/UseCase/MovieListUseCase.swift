//
//  MovieListUseCase.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import Combine
import NetworkKit

final class MovieListUseCase {
    
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    
    func execute(request: MovieListRequest) -> AnyPublisher<[Movie], AppError> {
        return repository.getMovies(request: request)
    }
}
