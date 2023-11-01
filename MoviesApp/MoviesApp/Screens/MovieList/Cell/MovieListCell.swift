//
//  MovieListCell.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 01/11/2023.
//

import UIKit
import Kingfisher

class MovieListCell: UITableViewCell {
    
    @IBOutlet weak private var movieImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(movie: Movie) {
        titleLabel.text = movie.originalTitle
        dateLabel.text = movie.releaseDate
        movieImageView.kf.setImage(with: URL(string: movie.posterPath))
    }
    
}
