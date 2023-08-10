//
//  RepositoryMock.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 9/8/23.
//

import Foundation
@testable import MovieApp

final class RespositoryMock: RepositoryProtocol {
    
    let success: Bool
    
    init(success: Bool) {
        self.success = success
    }
    
    func getTopMovies() async -> [Movie] {
        switch self.success {
        case true:
            return getMoviesDataExample()
        case false:
            return []
        }
    }
    
    func getPopularMovies() async -> [Movie] {
        switch self.success {
        case true:
            return getMoviesDataExample()
        case false:
            return []
        }
    }
    
    func getNewMovies() async -> [Movie] {
        switch self.success {
        case true:
            return getMoviesDataExample()
        case false:
            return []
        }
    }
    
    func getCast(movieId:Int) async -> [Actor] {
        switch self.success {
        case true:
            return getCastDataExample()
        case false:
            return []
        }
    }
    
    func getPlatforms(movieId:Int) async -> [Platform] {
        switch self.success {
        case true:
            return getPlatformsDataExample()
        case false:
            return []
        }
    }
    
    func getMovie(movieTitle: String) async -> Movie? {
        switch self.success {
        case true:
            return getMoviesDataExample().first
        case false:
            return nil
        }
    }
    
    
    
}
