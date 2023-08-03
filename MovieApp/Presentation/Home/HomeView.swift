//
//  HomeView.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import SwiftUI

let backgroundColor = Color(red: 0.063, green: 0.176, blue: 0.243)

let movies: [Movie] = [
    .init(id: "2", name: "Interstellar", synopsis: "Vamos a salvar el mundo metiendonos en un agujero negro", rate: 9, image: "https://m.media-amazon.com/images/I/51UYbs7t0sL._AC_UF1000,1000_QL80_.jpg"),
    .init(id: "3", name: "El Padrino", synopsis: "mafia, mafia, italianos y mas mafia", rate: 4, image: "https://i0.wp.com/www.cinemanet.info/wp-content/uploads/2015/10/poster-de-el-padrino.jpg?ssl=1"),
    .init(id: "1", name: "Memento", synopsis: "No se acuerda de nada el men", rate: 8.5, image: "https://m.media-amazon.com/images/I/515EOVqRexL._AC_.jpg")
]


struct MovieView: View {
    let movie: Movie
    let textFont: Font
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            AsyncImage(url: URL(string: movie.image)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "popcorn.fill")
                    .resizable()
            }
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .center))
                .opacity(0.8)
                .id(1)
                        
//            Text(movie.name)
//                .font(textFont)
//                .foregroundColor(.white)
//                .padding()
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .lineLimit(1)
//                .opacity(0.8)
        }
        .cornerRadius(10)
        .padding(.leading, 8)
    }
}

struct MovieSection: View {
    let movies: [Movie]
    let title: String
    
    var body: some View {
        Section(header:
            Text(title)
                .foregroundColor(.white)
                .padding(8)
                .font(.title3)){
//            Divider().background(.white)
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
    @State private var paddingAnim = 500.0
    @State private var searchText = ""
    @ObservedObject var homeViewModel: HomeViewModel
    
    init(homeViewModel: HomeViewModel) {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barStyle = .black
        self.homeViewModel = homeViewModel
    }
    
    var body: some View {

        NavigationView {
            List {
                PrincipalMovieSection(movies: movies)
                    .padding(.leading, paddingAnim)
                MovieSection(movies: movies, title: "Most Popular")
                    .padding(.leading, -paddingAnim)
                MovieSection(movies: movies, title: "Top Rated")
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Movie App"))
            .background(backgroundColor)
            .onAppear{
                DispatchQueue.main.async {
                    withAnimation(.linear(duration: 0.8)) {
                        paddingAnim = 0
                    }
                }
            }
        }
        .searchable(text: $searchText,prompt: "Search movie")

    }
    
    var searchResults: String {
        ""
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let remoteDataSource = RemoteDataSourceImpl()
        let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
        let homeViewModel = HomeViewModel(repository: repository)
        HomeView(homeViewModel: homeViewModel)
    }
}

