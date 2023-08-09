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
        guard let newMovies = try? await repository.getNewMovies() else {
            print("Error getting upcoming movies")
            return
        }
        DispatchQueue.main.async {
            self.newMovies = newMovies
        }
    }
    
    func getTopMovies() async {
        guard let topMovies = try? await repository.getTopMovies() else {
            print("Error getting top rated movies")
            return
        }
        DispatchQueue.main.async {
            self.topMovies = topMovies
        }
    }
    
    func getPopularMovies() async {
        guard let popularMovies = try? await repository.getPopularMovies() else {
            print("Error getting popular movies")
            return
        }
        DispatchQueue.main.async {
            self.popularMovies = popularMovies
        }
    }
    
}
