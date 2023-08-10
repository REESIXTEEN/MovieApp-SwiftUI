//
//  RepositoryProtocol.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation

protocol RepositoryProtocol {
    
    func getTopMovies() async -> [Movie]
    func getPopularMovies() async -> [Movie]
    func getNewMovies() async -> [Movie]
    func getCast(movieId:Int) async -> [Actor]
    func getPlatforms(movieId:Int) async -> [Platform]
    func getMovie(movieTitle: String) async -> Movie?
    
}
