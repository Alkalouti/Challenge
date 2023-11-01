//
//  Extension+String.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation

extension String {
    var trimWhitespacesAndNewLines: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
