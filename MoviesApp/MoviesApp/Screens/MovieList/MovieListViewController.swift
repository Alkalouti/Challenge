//
//  ViewController.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import UIKit
import Combine

private let movieCellIdentifier = "MovieListCell"

final class MovieListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: MovieListViewModel!
    private var dataSource: TableViewDataSource<MovieListCell, Movie>!
    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setBinding()
        viewModel.getMovieList()
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Movies List"
    }
    
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
                            self.dataSource.updateItems(data)
                        }
                        self.tableView.reloadData()
                    case .failure:
                        self.hideLoading()
                        if let error = result.error {
                            self.handleError(with: error)
                        }
                    }
                }.store(in: &subscriptions)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: movieCellIdentifier, bundle: nil), forCellReuseIdentifier: movieCellIdentifier)

        dataSource = TableViewDataSource(cellIdentifier: movieCellIdentifier,
                                                  items: viewModel.movies) { cell, item, indexPath  in
            cell.setupCell(movie: item)
        }
        
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(ViewControllersAssembly.makeMovieDetailsViewController(movieId: viewModel.returnMovieId(row: indexPath.row)), animated: true)
    }
}
