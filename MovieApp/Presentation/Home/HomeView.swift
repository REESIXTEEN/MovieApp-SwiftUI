//
//  HomeView.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import SwiftUI

let backgroundColor = Color(red: 0.063, green: 0.176, blue: 0.243)

struct MovieView: View {
    let movie: Movie
    let textFont: Font
    
    var body: some View {
        NavigationLink {
            DetailView(movie: movie)
        } label: {
            ZStack(alignment: .bottom) {
                
                AsyncImage(url: URL(string: movie.poster_path)) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image(systemName: "popcorn.fill")
                        .resizable()
                }
            }
            .cornerRadius(10)
            .padding(.leading, 8)
        }
    }
}

struct MovieSection: View {
    let movies: [Movie]
    let title: String
    
    var body: some View {
        VStack{
            Text(title)
                .foregroundColor(.white)
                .padding(.top, 16)
                .padding(.leading, 8)
                .padding(.bottom, -4)
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach(movies) { movie in
                        MovieView(movie: movie, textFont: .title3)
                            .frame(width: 150, height: 200)
                    }
                }
            }
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(backgroundColor)
        
    }
}


struct PrincipalMovieSection: View {
    let movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: -20) {
                ForEach(movies) { movie in
                    GeometryReader { geometry in
                        MovieView(movie: movie, textFont: .title)
                            .rotation3DEffect(Angle(
                                    degrees: (Double(geometry.frame(in: .global).minX)) / -10),
                                    axis: (x: 0, y: 10.0, z: 0))
                    }
                    .frame(width: 300, height: 400)
                }
            }
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(backgroundColor)
    }
}


struct HomeView: View {
    @State private var paddingAnim = 5000.0
    @State private var searchText = ""
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            List {
                PrincipalMovieSection(movies: viewModel.newMovies)
                    .padding(.leading, paddingAnim)

                MovieSection(movies: viewModel.popularMovies, title: "Most Popular")
                    .padding(.leading, -paddingAnim)

                MovieSection(movies: viewModel.topMovies, title: "Top Rated")
                
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Movie App"))
            .background(backgroundColor)
            .onAppear{
                DispatchQueue.main.async {
                    withAnimation(.linear(duration: 1).delay(1.5)) {
                        paddingAnim = 0
                    }
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .searchable(text: $searchText,prompt: "Search movie")
    }
    
    var searchResults: String {
        ""
    }
}


//struct prueba: View {
//    @State private var showHome = false
//    var body: some View {
//        if showHome {
//            let remoteDataSource = RemoteDataSourceImpl()
//            let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
//            let homeViewModel = HomeViewModel(repository: repository)
//            HomeView(homeViewModel: homeViewModel)
//        }
//        else {
//            SplashView()
//                .onAppear{
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//                        showHome = true
//                    }
//                }
//        }
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let remoteDataSource = RemoteDataSourceImpl()
        let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
        let viewModel = HomeViewModel(repository: repository)
        HomeView(viewModel: viewModel)
    }
}

