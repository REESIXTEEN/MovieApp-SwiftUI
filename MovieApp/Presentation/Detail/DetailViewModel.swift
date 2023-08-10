//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 8/8/23.
//

import Foundation


final class DetailViewModel: ObservableObject {
    
    private let repository: RepositoryProtocol
    @Published var movie: Movie?
    @Published var cast: [Actor] = []
    @Published var platforms: [Platform] = []
    
    
    init(repository: RepositoryProtocol, movie: Movie?) {
        self.repository = repository
        self.movie = movie
    }
    
    func getCast(movieId:Int) async {
        let cast =  await repository.getCast(movieId: movieId)
        DispatchQueue.main.async {
            self.cast = cast
        }
    }
    
    func getPlatforms(movieId:Int) async {
        let platforms = await repository.getPlatforms(movieId: movieId)
        DispatchQueue.main.async {
            self.platforms = platforms
        }
    }
    
}
