//
//  ExampleData.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 3/8/23.
//

import Foundation

let movies: [Movie] = [
    .init(id: "2", name: "Interstellar", synopsis: "Al ver que la vida en la Tierra está llegando a su fin, un grupo de exploradores dirigidos por el piloto Cooper (McConaughey) y la científica Amelia (Hathaway) emprende una misión que puede ser la más importante de la historia de la humanidad: viajar más allá de nuestra galaxia para descubrir algún planeta en otra que pueda garantizar el futuro de la raza humana.", rate: 9.0, image: "https://m.media-amazon.com/images/I/51UYbs7t0sL._AC_UF1000,1000_QL80_.jpg"),
    .init(id: "3", name: "El Padrino", synopsis: "mafia, mafia, italianos y mas mafia", rate: 4, image: "https://i0.wp.com/www.cinemanet.info/wp-content/uploads/2015/10/poster-de-el-padrino.jpg?ssl=1"),
    .init(id: "1", name: "Memento", synopsis: "No se acuerda de nada el men", rate: 8.5, image: "https://m.media-amazon.com/images/I/515EOVqRexL._AC_.jpg")
]

let cast: [Actor] = [
    .init(id: "1", name: "Margot Robie", image: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"),
    .init(id: "2", name: "Margot Robie", image: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"),
    .init(id: "3", name: "Margot Robie", image: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"),
    .init(id: "4", name: "Margot Robie", image: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"),
    
]

let platforms: [Platform] = [
    .init(id: "1", name: "Apple TV", image: "https://image.tmdb.org/t/p/w500/peURlLlr8jggOwK53fJ5wdQl05y.jpg"),
    .init(id: "2", name: "Amazon Video", image: "https://image.tmdb.org/t/p/w500/5NyLm42TmCqCMOZFvH4fcoSNKEW.jpg"),
    .init(id: "3", name: "Movistar Play", image: "https://image.tmdb.org/t/p/w500/cDzkhgvozSr4GW2aRdV22uDuFpw.jpg")

]
