//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 01/11/2023.
//

import Foundation
import Combine

final class MovieDetailsViewModel {
    
    private let useCase: MovieDetailsUseCase!
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let publisher = PassthroughSubject<APIResult<MovieDetails?>, Never>()
    private(set) var movieDetails: MovieDetails?
    private var movieId: Int!
    
    var updateUIPublisher: AnyPublisher<APIResult<MovieDetails?>, Never> {
        publisher.eraseToAnyPublisher()
    }
    
    init(useCase: MovieDetailsUseCase, movieId: Int) {
        self.useCase = useCase
        self.movieId = movieId
    }
    
    func getMovieList() {
        publisher.send(.loading())
        
        let request = MovieDetailsRequest(id: movieId)
        useCase.execute(request: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.publisher.send(.failure(error: error))
                }
            }, receiveValue: { [weak self] movieDetails in
                guard let self = self else {return}
                self.movieDetails = movieDetails
                self.publisher.send(.success(result: movieDetails))
            }).store(in: &bag)
    }
}
