//
//  DetailView.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 4/8/23.
//

import SwiftUI


struct PrincipalImage: View {
    let movieImage: String
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: movieImage)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "popcorn.fill")
                    .resizable()
                    .scaledToFill()
            }
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [backgroundColor, .clear]), startPoint: .bottom, endPoint: .center))
        }
    }
}

struct ActorView: View {
    let actor: Actor
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: actor.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "popcorn.fill")
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 100, height: 100)
            .cornerRadius(100)
            
            Text(actor.name)
                .font(.footnote)
                .foregroundColor(.white)
                .lineLimit(1)
        }
        .frame(width: 100)
        .padding(.leading,8)
    }
}

struct PlatformView: View {
    let platform: Platform
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: platform.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "popcorn.fill")
                    .resizable()
                    .scaledToFill()
            }
            .frame(width: 50, height: 50)
            .cornerRadius(10)
        }
        .frame(width: 50)
        .padding(.leading,8)
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .padding(8)
            .bold()
            .font(.title2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CastSection: View {
    let cast: [Actor]
    var body: some View {
        Section(header:SectionHeader(title: "Cast")){
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach(cast) { actor in
                        ActorView(actor: actor)
                    }
                }
            }
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(backgroundColor)
    }
}

struct PlatformsSection: View {
    let platforms: [Platform]
    var body: some View {
        Section(header:SectionHeader(title: "Platforms")){
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach(platforms) { platform in
                        PlatformView(platform: platform)
                    }
                }
            }
        }
        .listRowInsets(EdgeInsets())
        .listRowBackground(backgroundColor)
    }
}


struct DetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView{
            VStack {
                PrincipalImage(movieImage: movie.image)
                    .frame(height: 400)
                
                HStack{
                    Text(movie.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(8)
                        .lineLimit(1)
                    Spacer()
                    Text(String(format: "%.1f / 10", movie.rate))
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(8)
                        .lineLimit(1)
                }
                
                HStack{
                    Text("Country: \(movie.name)")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(8)
                        .lineLimit(1)
                    Spacer()
                    Text(movie.name)
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(8)
                        .lineLimit(1)
                    
                }
                
                Text(movie.synopsis)
                    .font(.body)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                
                CastSection(cast: cast)
                PlatformsSection(platforms: platforms)
                
            }
            
        }
        .background(backgroundColor)
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: movies[0])
//        ActorView(actor: .init(id: "1", name: "Margot Robie", photo: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"))
    }
}
