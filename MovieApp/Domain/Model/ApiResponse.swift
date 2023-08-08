//
//  ApiResponse.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 7/8/23.
//

import Foundation

struct ApiResponse: Codable {
    let results: [Movie]
}
