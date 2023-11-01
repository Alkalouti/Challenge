//
//  InjectionUtils.swift
//  MoviesApp
//
//  Created by Ahmad Kalouti on 31/10/2023.
//

import Foundation

final class InjectionUtils {
    static private func provideRemoteDataSource() -> RemoteDataSource {
        return RemoteDataSourceImpl()
    }
    
    static func provideMoviesRepository() -> MoviesRepository {
        return MoviesRepositoryImpl(remoteDataSource: provideRemoteDataSource(), mapper: MovieMapper())
    }
}
