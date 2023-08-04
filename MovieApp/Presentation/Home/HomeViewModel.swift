//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import Foundation


final class HomeViewModel: ObservableObject {
    
    private let repository: RepositoryProtocol
    @Published var Newmovies: [Movie] = []
    @Published var Topmovies: [Movie] = []
    @Published var Trendingmovies: [Movie] = []
    
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        getNewMovies()
    }
    
    func getNewMovies() {
        repository.getNewMovies()
    }
    
    func getTopMovies() {
        repository.getTopMovies()
    }
    
    func getTrendingMovies() {
        repository.getTrendingMovies()
    }
    
}
