//
//  Repository.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation


final class RepositoryImpl: RepositoryProtocol {

    private let remoteDataSource: RemoteDataSourceProtocol
    
    init(remoteDataSource: RemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getTopMovies() async throws -> [Movie] {
        guard let movies =  try? await remoteDataSource.getTopMovies() else { return [] }
        return mapMoviePhoto(movies: movies)
    }
    
    func getPopularMovies() async throws -> [Movie] {
        guard let movies =  try? await remoteDataSource.getPopularMovies() else { return [] }
        return mapMoviePhoto(movies: movies)
    }
    
    func getNewMovies() async throws -> [Movie] {
        guard let movies =  try? await remoteDataSource.getNewMovies() else { return [] }
        return mapMoviePhoto(movies: movies)
    }
    
    
}
