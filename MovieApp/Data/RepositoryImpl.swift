//
//  Repository.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation


final class RepositoryImpl: RepositoryProtocol {

    private let remoteDataSource: RemoteDataSourceProtocol
    let token = ""
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getTopMovies() {
        remoteDataSource.getTopMovies(token: token)
    }
    
    func getTrendingMovies() {
        remoteDataSource.getTrendingMovies(token: token)
    }
    
    func getNewMovies() {
        remoteDataSource.getNewMovies(token: token)
    }
    
}
