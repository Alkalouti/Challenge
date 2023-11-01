//
//  MovieDetailsUseCase.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 01/11/2023.
//

import Foundation
import Combine
import NetworkKit

final class MovieDetailsUseCase {
    
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    
    func execute(request: MovieDetailsRequest) -> AnyPublisher<MovieDetails?, AppError> {
        return repository.getMovieDetails(request: request)
    }
}
