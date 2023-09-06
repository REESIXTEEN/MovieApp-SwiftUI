//
//  NetworkMock.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 10/8/23.
//

import Foundation
@testable import MovieApp

class NetworkMock: NetworkProtocol {
    
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        
        switch url.url?.absoluteString {
            
        case "https://api.themoviedb.org/3/movie/upcoming":
            let typeData = MovieApiResponse(results: getMoviesDataExample())
            guard let data = try? JSONEncoder().encode(typeData) else {return (Data(),URLResponse())}
            return encode(data: data)
            
        case "https://api.themoviedb.org/3/movie/top_rated":
            let typeData = MovieApiResponse(results: getMoviesDataExample())
            guard let data = try? JSONEncoder().encode(typeData) else {return (Data(),URLResponse())}
            return encode(data: data)
            
        case "https://api.themoviedb.org/3/movie/popular":
            let typeData = MovieApiResponse(results: getMoviesDataExample())
            guard let data = try? JSONEncoder().encode(typeData) else {return (Data(),URLResponse())}
            return encode(data: data)
            
        case "https://api.themoviedb.org/3/movie/1/credits":
            let typeData = CastApiResponse(id: 1234, cast: getCastDataExample())
            guard let data = try? JSONEncoder().encode(typeData) else {return (Data(),URLResponse())}
            return encode(data: data)
            
        case "https://api.themoviedb.org/3/movie/1/watch/providers":
            let typeData = PlatformApiResponse(id: 1234, results: Country(ES: PlatformType(rent: getPlatformsDataExample())))
            guard let data = try? JSONEncoder().encode(typeData) else {return (Data(),URLResponse())}
            return encode(data: data)
            
        case "https://api.themoviedb.org/3/search/movie?query=title&include_adult=true":
            let typeData = MovieApiResponse(results: [getMoviesDataExample().first!])
            guard let data = try? JSONEncoder().encode(typeData) else {return (Data(),URLResponse())}
            return encode(data: data)
            
        default:
            return (Data(), URLResponse())
        }
        
    }
    
    private func encode(data: Data) -> (Data, URLResponse){
        let stringJson = String(data: data, encoding: .utf8)
        let finalData = Data(stringJson!.utf8)
        return (finalData, URLResponse())
    }
}
