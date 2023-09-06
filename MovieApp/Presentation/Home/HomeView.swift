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
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationLink {
            let viewModel = DetailViewModel(repository: homeViewModel.repository, movie: movie)
            DetailView(viewModel: viewModel)
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
    @State private var searchedMovie: Movie? = nil
    @State private var goToSearchedMovie = false
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            List {
                PrincipalMovieSection(movies: viewModel.newMovies)
                    .padding(.leading, paddingAnim/10)

                MovieSection(movies: viewModel.popularMovies, title: "Most Popular")
                    .padding(.leading, -paddingAnim)

                MovieSection(movies: viewModel.topMovies, title: "Top Rated")
                
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Movie App"))
            .background(backgroundColor)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(backgroundColor, for: .navigationBar)
            .task{
                withAnimation(.linear(duration: 1).delay(1)) {
                    paddingAnim = 0
                }
            }
            
            NavigationLink(isActive: $goToSearchedMovie) {
                let viewModel = DetailViewModel(repository: viewModel.repository, movie: searchedMovie)
                DetailView(viewModel: viewModel)
                
            } label: {
                EmptyView()
            }

        }
        .searchable(text: $searchText,prompt: "Search movie")
        .onSubmit(of: .search){
            Task{
                searchedMovie = await viewModel.getMovie(movieTitle: searchText)
                goToSearchedMovie = true
            }
        }

        //splash screen ----- Done this way to be able to load de images while the splash is showing
        .overlay{
            SplashView()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let remoteDataSource = RemoteDataSourceImpl()
        let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
        let viewModel = HomeViewModel(repository: repository)
        HomeView()
            .environmentObject(viewModel)
    }
}

