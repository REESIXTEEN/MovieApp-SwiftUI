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
    
    func getTopMovies() async -> [Movie] {
        guard let movies =  try? await remoteDataSource.getTopMovies() else { return [] }
        return mapMoviePhoto(movies: movies)
    }
    
    func getPopularMovies() async -> [Movie] {
        guard let movies =  try? await remoteDataSource.getPopularMovies() else { return [] }
        return mapMoviePhoto(movies: movies)
    }
    
    func getNewMovies() async -> [Movie] {
        guard let movies =  try? await remoteDataSource.getNewMovies() else { return [] }
        return mapMoviePhoto(movies: movies)
    }
    
    func getCast(movieId : Int) async -> [Actor] {
        guard let cast =  try? await remoteDataSource.getCast(movieId: movieId) else { return [] }
        return mapActorPhoto(actors: cast)
    }
    
    func getPlatforms(movieId : Int) async -> [Platform] {
        guard let platforms =  try? await remoteDataSource.getPlatforms(movieId: movieId) else { return [] }
        return mapPlatformPhoto(platforms: platforms)
    }
    
    func getMovie(movieTitle: String) async -> Movie? {
        guard let movies =  try? await remoteDataSource.getTopMovies() else { return nil }
        return movies.first
    }
    
    
}
