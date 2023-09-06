//
//  Movie.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation


struct Movie: Codable, Identifiable, Equatable, Hashable {
    let id: Int
    let overview: String
    let popularity: Double
    let poster_path: String
    let title: String
    let vote_average: Double
    let release_date: String
}

struct MovieApiResponse: Codable {
    let results: [Movie]
}
