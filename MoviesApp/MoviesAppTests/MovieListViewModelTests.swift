//
//  MovieListViewModelTests.swift
//  MoviesAppTests
//
//  Created by Ahmad Kalouti on 01/11/2023.
//

import XCTest
import Combine
@testable import MoviesApp

final class MovieListViewModelTests: XCTestCase {
    
    var subscriptions = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testIfMovieArrCountIsZero() {
        var movies = [Movie]()
        var error: Error?
        let useCase = MovieListUseCase(repository: FakeEmptyMoviesRepositoryImpl())
        let viewModel = MovieListViewModel(useCase: useCase)
        
        let expectation = self.expectation(description: "Fetch")

        XCTAssertNotNil(viewModel)
        viewModel.getMovieList()
        viewModel.updateUIPublisher
            .sink(receiveCompletion: { completion in
                // Handle the error
            }) { result in
                switch result.status {
                case .loading:
                    break
                case .success:
                    if let data = result.data {
                        movies = data
                    }
                case .failure:
                    break
                }
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        waitForExpectations(timeout: 10)

        XCTAssertNil(error)
        XCTAssertEqual(movies.count, 0)
        
    }
    func testIfMovieArrCountIsNoEmpty() {
        var movies = [Movie]()
        var error: Error?

        let useCase = MovieListUseCase(repository: FakeMoviesRepositoryImpl())
        let viewModel = MovieListViewModel(useCase: useCase)
        XCTAssertNotNil(viewModel)

        let expectation = self.expectation(description: "Fetch")
        
        viewModel.getMovieList()
        viewModel.updateUIPublisher
            .sink(receiveCompletion: { completion in
                // Handle the error
            }) { result in
                switch result.status {
                case .loading:
                    break
                case .success:
                    if let data = result.data {
                       movies = data
                    }
                case .failure:
                    break
                }
                
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        waitForExpectations(timeout: 10)

        XCTAssertNil(error)
        XCTAssertNotEqual(movies.count, 0)
    }
    
    func testViewModeIfErrorIsNotNull() {
        var movies = [Movie]()
        var error: Error?
        
        let useCase = MovieListUseCase(repository: FakeErrorMoviesRepositoryImpl())
        let viewModel = MovieListViewModel(useCase: useCase)
        XCTAssertNotNil(viewModel)
        
        let expectation = self.expectation(description: "Fetch")

        viewModel.getMovieList()
        viewModel.updateUIPublisher
            .sink(receiveCompletion: { completion in
                // Handle the error
            }) { result in
                switch result.status {
                case .loading:
                    break
                case .success:
                    break
                case .failure:
                    if let serverError = result.error {
                        error = serverError
                    }
                }
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        waitForExpectations(timeout: 10)
        
        XCTAssertNotNil(error)
        XCTAssertEqual(movies.count, 0)
    }
    
    func testIfReturnMovieIdNotEmpty() {
        var movies = [Movie]()
        
        let useCase = MovieListUseCase(repository: FakeMoviesRepositoryImpl())
        let viewModel = MovieListViewModel(useCase: useCase)
        XCTAssertNotNil(viewModel)
        
        let expectation = self.expectation(description: "Fetch")

        viewModel.getMovieList()
        viewModel.updateUIPublisher
            .sink(receiveCompletion: { completion in

            }) { result in
                switch result.status {
                case .loading:
                    break
                case .success:
                    if let data = result.data {
                        movies = data
                    }
                case .failure:
                    break
                }
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        waitForExpectations(timeout: 10)
        
        XCTAssertNotEqual(movies.count, 0)
        XCTAssertEqual(viewModel.returnMovieId(row: 0), 0)
    }
    
}
