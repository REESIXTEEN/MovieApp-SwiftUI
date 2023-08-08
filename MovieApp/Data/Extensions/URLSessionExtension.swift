//
//  URLSessionExtension.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 7/8/23.
//

import Foundation

extension URLSession: NetworkProtocol {
    func data(url: URLRequest) async throws -> (Data, URLResponse) {
        return try await data(for: url)
    }
    
}
