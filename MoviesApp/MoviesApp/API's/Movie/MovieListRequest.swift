//
//  MovieListRequest.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation

struct MovieListRequest {
    
    let page: Int
    
    func toDic() -> [String : Any] {
        return ["include_adult" : false,
                "include_video" : false,
                "language" : "en-US",
                "page" : page,
                "sort_by" : "popularity.desc"]
    }
}
