//
//  RepositoryProtocol.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation

protocol RepositoryProtocol {
    
    func getTopMovies()
    func getTrendingMovies()
    func getNewMovies()
    
}
