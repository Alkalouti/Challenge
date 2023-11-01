//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 01/11/2023.
//

import UIKit
import Combine
import Kingfisher

final class MovieDetailsViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak private var movieImageView: UIImageView!
    @IBOutlet weak private var movieNameLabel: UILabel!
    @IBOutlet weak private var releaseDateLabel: UILabel!
    @IBOutlet weak private var overviewLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: MovieDetailsViewModel!
    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBinding()
        viewModel.getMovieList()
        
        navigationItem.largeTitleDisplayMode = .never
        title = "Movies Details"
    }
    
    // MARK: - Private
    private func setBinding() {
        viewModel.updateUIPublisher
                .sink(receiveCompletion: { completion in
                    // Handle the error
                }) { [weak self] result in
                    guard let self = self else { return }
                    switch result.status {
                    case .loading:
                        self.showLoading()
                    case .success:
                        self.hideLoading()
                        if let data = result.data {
                            self.updateUI(movieDetials: data)
                        }
                    case .failure:
                        self.hideLoading()
                        if let error = result.error {
                            self.handleError(with: error)
                        }
                    }
                }.store(in: &subscriptions)
    }
    
    private func updateUI(movieDetials: MovieDetails?) {
        guard let movieDetials = movieDetials else { return }
        movieImageView.kf.setImage(with: URL(string: movieDetials.posterPath))
        movieNameLabel.text = movieDetials.originalTitle
        releaseDateLabel.text = movieDetials.releaseDate
        overviewLabel.text = movieDetials.overview
    }

}
