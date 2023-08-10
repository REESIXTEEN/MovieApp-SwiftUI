//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    let repository: RepositoryProtocol
    @Published var newMovies: [Movie] = []
    @Published var topMovies: [Movie] = []
    @Published var popularMovies: [Movie] = []
    
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        DispatchQueue.main.async {
            Task {
                await self.getNewMovies()
                await self.getTopMovies()
                await self.getPopularMovies()
            }
        }
    }
    
    func getNewMovies() async {
        let newMovies = await repository.getNewMovies() 
        DispatchQueue.main.async {
            self.newMovies = newMovies
        }
    }
    
    func getTopMovies() async {
        let topMovies = await repository.getTopMovies()
        DispatchQueue.main.async {
            self.topMovies = topMovies
        }
    }
    
    func getPopularMovies() async {
        let popularMovies = await repository.getPopularMovies()
        DispatchQueue.main.async {
            self.popularMovies = popularMovies
        }
    }
    
    func getMovie(movieTitle: String) async -> Movie? {
        let movie = await repository.getMovie(movieTitle: movieTitle)
        return movie
    }
    
}
