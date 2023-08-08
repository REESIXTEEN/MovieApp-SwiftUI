//
//  Mappers.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 7/8/23.
//

import Foundation

func mapMoviePhoto(movies: [Movie]) -> [Movie] {
    return movies.map { movie in
        Movie(id: movie.id, overview: movie.overview, popularity: movie.popularity, poster_path: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)", title: movie.title, vote_average: movie.vote_average)
    }
}
