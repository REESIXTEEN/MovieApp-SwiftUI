//
//  Movie.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation


struct Movie: Identifiable {
    let id: String
    let name: String
    let synopsis: String
    let rate: Float
    let image: String
}
