//
//  RemoteDataSourceImpl.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation

enum endpoints : String {
    case newMovies = "movie/upcoming"
    case topMovies = "movie/top_rated"
    case popularMovies = "movie/popular"
}

enum servers : String {
    case tmdb3 = "https://api.themoviedb.org/3/"
}

enum NetworkError: Error, Equatable {
    case malformedURL
    case noData
    case noUser
    case errorCode(Int?)
    case tokenFormat
    case decoding
    case other
}

class RemoteDataSourceImpl: RemoteDataSourceProtocol {
    
    private let session: NetworkProtocol
    
    init(session: NetworkProtocol = URLSession.shared) {
        self.session = session
    }
    
    func getTopMovies() async throws -> [Movie]? {
        guard let request = BaseRequest.getRequest(server: servers.tmdb3.rawValue, endpoint: endpoints.topMovies.rawValue) else {
            throw NetworkError.malformedURL
        }
        
        let (data, _) = try await session.data(url: request)
        let newMovies = try JSONDecoder().decode(ApiResponse.self, from: data)
        return newMovies.results
    }
    
    func getPopularMovies() async throws -> [Movie]? {
        guard let request = BaseRequest.getRequest(server: servers.tmdb3.rawValue, endpoint: endpoints.popularMovies.rawValue) else {
            throw NetworkError.malformedURL
        }
        
        let (data, _) = try await session.data(url: request)
        let newMovies = try JSONDecoder().decode(ApiResponse.self, from: data)
        return newMovies.results
    }
    
    func getNewMovies() async throws -> [Movie]?{
        guard let request = BaseRequest.getRequest(server: servers.tmdb3.rawValue, endpoint: endpoints.newMovies.rawValue) else {
            throw NetworkError.malformedURL
        }
        
        let (data, _) = try await session.data(url: request)
        let newMovies = try JSONDecoder().decode(ApiResponse.self, from: data)
        return newMovies.results
        
    }
    
    
}
