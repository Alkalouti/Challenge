//
//  MovieMapper.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation

final class MovieMapper {
    
    func map(movie: MoviesResponse) -> Movie {
        return Movie(id: movie.id,
                     originalTitle: movie.originalTitle,
                     posterPath: Constants.URLPath.imageURL + movie.posterPath,
                     releaseDate: movie.releaseDate)
    }
    
    func map(movies: [MoviesResponse]) -> [Movie] {
        return movies.map {
            map(movie: $0)
        }
    }
    
    func map(details: MovieDetailsResponse) -> MovieDetails {
        return MovieDetails(id: details.id,
                            originalTitle: details.originalTitle,
                            posterPath: Constants.URLPath.imageURL + details.posterPath,
                            overview: details.overview,
                            releaseDate: details.releaseDate)
    }
}
