//
//  Movie.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let originalTitle: String
    let posterPath: String
    let releaseDate: String
}
