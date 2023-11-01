//
//  Enviroment.swift
//  NetworkKit
//
//  Created by Ahmad Kalouti on 30/10/2023.
//

import Foundation

public enum Enviroment : Int {
    case production
    case staging
    
    var url : String {
        switch self {
        case .staging:
            return  Constants.stagingURL
        case .production:
            return Constants.propuctionURL
        }
    }
}
