//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import Combine

final class MovieListViewModel {
    
    private let useCase: MovieListUseCase!
    private var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    private let publisher = PassthroughSubject<APIResult<[Movie]>, Never>()
    private(set) var movies: [Movie] = []
    
    var updateUIPublisher: AnyPublisher<APIResult<[Movie]>, Never> {
        publisher.eraseToAnyPublisher()
    }
    
    init(useCase: MovieListUseCase) {
        self.useCase = useCase
    }
    
    func getMovieList() {
        publisher.send(.loading())
        
        let request = MovieListRequest(page: 1)
        useCase.execute(request: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.publisher.send(.failure(error: error))
                }
            }, receiveValue: { [weak self] movies in
                guard let self = self else { return }
                self.movies.append(contentsOf: movies)
                self.publisher.send(.success(result: self.movies))
            }).store(in: &bag)
    }
    
    func returnMovieId(row: Int) -> Int {
        return movies[row].id
    }
}
