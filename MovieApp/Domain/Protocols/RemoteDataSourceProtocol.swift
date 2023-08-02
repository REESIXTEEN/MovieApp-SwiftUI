//
//  RemoteDataSourceProtocol.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation

protocol RemoteDataSourceProtocol {
    
    func getTopMovies(token:String)
    func getTrendingMovies(token:String)
    func getNewMovies(token:String)
    
}
