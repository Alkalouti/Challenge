//
//  MovieDetailsRequest.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 01/11/2023.
//

import Foundation

struct MovieDetailsRequest {
    
    let id: Int
    
    func toDic() -> [String : Any] {
        return [ "language" : "en-US" ]
    }
}
