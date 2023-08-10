//
//  Actor.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 4/8/23.
//

import Foundation


struct Actor: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    var profile_path: String?
}

struct CastApiResponse: Codable {
    let id: Int
    let cast: [Actor]
}
