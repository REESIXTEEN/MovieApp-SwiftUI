//
//  Platform.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 4/8/23.
//

import Foundation

struct Platform: Codable, Identifiable{
    var id: Int {provider_id}
    let provider_id: Int
    let logo_path: String
    let provider_name: String
}

struct PlatformType: Codable {
    let rent: [Platform]
}

struct Country: Codable  {
    let ES:  PlatformType
}

struct PlatformApiResponse: Codable {
    let id: Int
    let results: Country
}
