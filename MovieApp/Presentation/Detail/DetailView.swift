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
                .frame(height: 400)
        }
        .frame(height: 400)
        .clipped()
    }
}

struct ActorView: View {
    let actor: Actor
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: actor.profile_path ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "person.circle")
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
            AsyncImage(url: URL(string: platform.logo_path)) { image in
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
        .padding(.bottom, 8)
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
        .padding(.bottom, 8)
    }
}


struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel
    
    var body: some View {
        
        if let movie = viewModel.movie{
            ScrollView{
                VStack {
                    PrincipalImage(movieImage: movie.poster_path)
                    
                    HStack{
                        Text(movie.title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(8)
                            .lineLimit(1)
                        Spacer()
                        Text(String(format: "%.1f / 10", movie.vote_average))
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(8)
                            .lineLimit(1)
                    }
                    
                    Text("Fecha de estreno: \(movie.release_date)")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(8)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(movie.overview)
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(8)
                    
                    if(!viewModel.cast.isEmpty){
                        CastSection(cast: viewModel.cast)
                    }
                    if(!viewModel.platforms.isEmpty){
                        PlatformsSection(platforms: viewModel.platforms)
                    }
                    
                }
            }
            .background(backgroundColor)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.getCast(movieId: movie.id)
                await viewModel.getPlatforms(movieId: movie.id)
            }
        }
        else{
            Text("Movie not found")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(backgroundColor)
                .foregroundColor(.white)
        }
        
    
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let remoteDataSource = RemoteDataSourceImpl()
        let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
        let viewModel = DetailViewModel(repository: repository, movie: nil)
        DetailView(viewModel: viewModel)
    }
}
