//
//  Network.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation
import Combine


class Network {
    
    func fetchApiData<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T: Decodable {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap{ result in
                guard let response = result.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
