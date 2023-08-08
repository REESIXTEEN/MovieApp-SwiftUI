//
//  Mappers.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 7/8/23.
//

import Foundation

func mapMoviePhoto(movies: [Movie]) -> [Movie] {
    return movies.map { movie in
        Movie(id: movie.id, overview: movie.overview, popularity: movie.popularity, poster_path: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)", title: movie.title, vote_average: movie.vote_average, release_date: movie.release_date)
    }
}

func mapActorPhoto(actors: [Actor]) -> [Actor] {
    let mapedActors =  actors.map { movieActor in
        Actor(id: movieActor.id, name: movieActor.name, profile_path: "https://image.tmdb.org/t/p/w500/\(movieActor.profile_path)")
    }.prefix(10)
    return Array(mapedActors)
}

func mapPlatformPhoto(platforms: [Platform]) -> [Platform] {
    let mappedPlatforms = platforms.map { platform in
        Platform(provider_id: platform.provider_id, logo_path: "https://image.tmdb.org/t/p/w500/\(platform.logo_path)", provider_name: platform.provider_name)
    }.prefix(10)
    return Array(mappedPlatforms)
}
