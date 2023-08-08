//
//  RemoteDataSourceProtocol.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation

protocol RemoteDataSourceProtocol {
    
    func getTopMovies() async throws -> [Movie]?
    func getPopularMovies() async throws -> [Movie]?
    func getNewMovies() async throws -> [Movie]?
    func getCast(movieId : Int) async throws -> [Actor]?
    func getPlatforms(movieId : Int) async throws -> [Platform]?
    
}
