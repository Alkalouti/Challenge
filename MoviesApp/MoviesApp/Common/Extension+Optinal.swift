//
//  Extension+Optinal.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation

extension Optional where Wrapped == String {
    var isBlank: Bool {
        guard let self = self else { return true }
        return self.trimWhitespacesAndNewLines.isEmpty
    }
    
    var nilIfEmpty: String? {
        guard let self = self else { return nil }
        return isBlank ? nil : self
    }
    
    var defaultIfEmpty: String {
        switch self {
        case .some:
            return self.nilIfEmpty ?? ""
        case .none:
            return ""
        }
    }
}
