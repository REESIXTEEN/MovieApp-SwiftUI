//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            let remoteDataSource = RemoteDataSourceImpl()
            let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
            let homeViewModel = HomeViewModel(repository: repository)
            HomeView(viewModel: homeViewModel)
            
        }
    }
}
