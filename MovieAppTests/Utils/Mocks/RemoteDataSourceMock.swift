//
//  RemoteDataSourceMock.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 10/8/23.
//

import Foundation
@testable import MovieApp

class RemoteDataSourceMock: RemoteDataSourceProtocol {
    
    let success: Bool
    
    init(success: Bool) {
        self.success = success
    }
    
    
    func getTopMovies() async throws -> [Movie]?{
        switch self.success {
        case true:
            return getMoviesDataExample()
        case false:
            return nil
        }
    }
    
    func getPopularMovies() async throws -> [Movie]?{
        switch self.success {
        case true:
            return getMoviesDataExample()
        case false:
            return nil
        }
    }
    func getNewMovies() async throws -> [Movie]?{
        switch self.success {
        case true:
            return getMoviesDataExample()
        case false:
            return nil
        }
    }
    
    func getCast(movieId : Int) async throws -> [Actor]?{
        switch self.success {
        case true:
            return getCastDataExample()
        case false:
            return nil
        }
    }
    
    func getPlatforms(movieId : Int) async throws -> [Platform]?{
        switch self.success {
        case true:
            return getPlatformsDataExample()
        case false:
            return nil
        }
    }
    
    func getMovie(movieTitle: String) async throws -> [Movie]?{
        switch self.success {
        case true:
            return getMoviesDataExample()
        case false:
            return nil
        }
    }
    
}
