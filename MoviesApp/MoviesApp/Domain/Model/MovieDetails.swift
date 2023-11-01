//
//  MovieDetails.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 01/11/2023.
//

import Foundation

struct MovieDetails: Codable {
    let id: Int
    let originalTitle: String
    let posterPath: String
    let overview: String
    let releaseDate: String
}
