//
//  NetworkProtocol.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 7/8/23.
//

import Foundation


protocol NetworkProtocol {
    
    func data(url: URLRequest) async throws  -> (Data, URLResponse)
}
