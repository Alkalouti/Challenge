//
//  ViewControllersAssembly+Movie.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation
import UIKit

extension ViewControllersAssembly {
    
    static func makeMovieListViewController() -> UINavigationController  {
        let viewController = AppStoryboard.movie.viewController(viewControllerClass: MovieListViewController.self)
        viewController.viewModel = MovieListViewModel(useCase: MovieListUseCase(repository: InjectionUtils.provideMoviesRepository()))
        let nav = UINavigationController(rootViewController: viewController)
        return nav
    }
    
    static func makeMovieDetailsViewController(movieId: Int) -> UIViewController  {
        let viewController = AppStoryboard.movie.viewController(viewControllerClass: MovieDetailsViewController.self)
        viewController.viewModel = MovieDetailsViewModel(useCase: MovieDetailsUseCase(repository: InjectionUtils.provideMoviesRepository()), movieId: movieId)
        return viewController
        
    }
}
