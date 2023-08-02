//
//  HomeView.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 2/8/23.
//

import SwiftUI

let movies: [Movie] = [
    .init(id: "1", name: "Memento", synopsis: "No se acuerda de nada el men", rate: 8.5, image: ""),
    .init(id: "2", name: "Interstellar", synopsis: "Vamos a salvar el mundo metiendonos en un agujero negro", rate: 9, image: ""),
    .init(id: "3", name: "El Padrino", synopsis: "mafia, mafia, italianos y mas mafia", rate: 4, image: "")
]

let backgroundColor = Color(red: 0.063, green: 0.176, blue: 0.243)


struct MovieView: View {
    let movie: Movie
    let textFont: Font
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            AsyncImage(url: URL(string: "")) { image in
                image
                    .resizable()
                    
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "popcorn.fill")
                    .resizable()
            }
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .center))
                .opacity(0.8)
                .id(1)
                        
            Text(movie.name)
                .font(textFont)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
        }
        .cornerRadius(10)
    }
}

struct MovieSection: View {
    let movies: [Movie]
    let title: String
    
    var body: some View {
        Section(header: Text(title).bold().foregroundColor(.white)) {
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(movies) { movie in
                        MovieView(movie: movie, textFont: .title3)
                            .frame(width: 150, height: 200)
                    }
                }
            }
        }
        .listRowBackground(backgroundColor)
    }
}


struct HomeView: View {
    @State private var searchText = ""
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barStyle = .black
    }
    
    var body: some View {

        NavigationView {
            List {
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(movies) { movie in
                            MovieView(movie: movie, textFont: .title)
                                .frame(width: 350, height: 400)
                        }
                    }
                }
                .listRowBackground(backgroundColor)
                
                MovieSection(movies: movies, title: "Most Popular")
                
                MovieSection(movies: movies, title: "Top Rated")
                
            }
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("Movie App"))
            .background(backgroundColor)
        }
        .searchable(text: $searchText,prompt: "Search movie")
    }
    
    var searchResults: String {
        if searchText.isEmpty {
            return ""
        } else {
            return "caca"
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

