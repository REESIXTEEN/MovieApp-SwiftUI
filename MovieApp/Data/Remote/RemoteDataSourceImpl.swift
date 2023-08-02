//
//  RemoteDataSourceImpl.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation


class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    // MARK: - Properties
    private let session: URLSession
    private let server: String = "https://api.themoviedb.org/3/movie/"
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getTopMovies(token:String) {
        
    }
    
    func getTrendingMovies(token:String) {
        <#code#>
    }
    
    func getNewMovies(token:String) {
        <#code#>
    }
    
    
}
