//
//  RemoteDataSourceImpl.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation

enum endpoints {
    case newMovies
    case topMovies
    case popularMovies
    case movieCast(id:Int)
    case moviePlatforms(id:Int)
    
    var path: String {
        switch self {
        case .movieCast(let id): return "movie/\(id)/credits"
        case .moviePlatforms(let id): return "movie/\(id)/watch/providers"
        case .newMovies : return "movie/upcoming"
        case .topMovies : return "movie/top_rated"
        case .popularMovies : return "movie/popular"
        }
    }
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
        guard let request = BaseRequest.getRequest(server: servers.tmdb3.rawValue, endpoint: endpoints.topMovies.path) else {
            throw NetworkError.malformedURL
        }
        
        let (data, _) = try await session.data(url: request)
        let newMovies = try JSONDecoder().decode(MovieApiResponse.self, from: data)
        return newMovies.results
    }
    
    func getPopularMovies() async throws -> [Movie]? {
        guard let request = BaseRequest.getRequest(server: servers.tmdb3.rawValue, endpoint: endpoints.popularMovies.path) else {
            throw NetworkError.malformedURL
        }
        
        let (data, _) = try await session.data(url: request)
        let newMovies = try JSONDecoder().decode(MovieApiResponse.self, from: data)
        return newMovies.results
    }
    
    func getNewMovies() async throws -> [Movie]?{
        guard let request = BaseRequest.getRequest(server: servers.tmdb3.rawValue, endpoint: endpoints.newMovies.path) else {
            throw NetworkError.malformedURL
        }
        
        let (data, _) = try await session.data(url: request)
        let newMovies = try JSONDecoder().decode(MovieApiResponse.self, from: data)
        return newMovies.results
        
    }
    
    func getCast(movieId : Int) async throws -> [Actor]?{
        guard let request = BaseRequest.getRequest(server: servers.tmdb3.rawValue, endpoint: endpoints.movieCast(id: movieId).path) else {
            throw NetworkError.malformedURL
        }
        
        let (data, _) = try await session.data(url: request)
        
        do{
            let response = try JSONDecoder().decode(CastApiResponse.self, from: data)
        }
        catch{
            print(error)
        }
        
        let response = try JSONDecoder().decode(CastApiResponse.self, from: data)
        return response.cast
        
    }
    
    func getPlatforms(movieId : Int) async throws -> [Platform]?{
        guard let request = BaseRequest.getRequest(server: servers.tmdb3.rawValue, endpoint: endpoints.moviePlatforms(id: movieId).path) else {
            throw NetworkError.malformedURL
        }
        
        let (data, _) = try await session.data(url: request)
        
        do{
            let response = try JSONDecoder().decode(PlatformApiResponse.self, from: data)
        }
        catch{
            print(error)
        }
        
        let response = try JSONDecoder().decode(PlatformApiResponse.self, from: data)
        return response.results.ES.rent
        
    }
}
