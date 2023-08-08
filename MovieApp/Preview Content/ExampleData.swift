//
//  ExampleData.swift
//  MovieApp
//
//  Created by Gómez Gruss Pablo on 3/8/23.
//

import Foundation

let movies: [Movie] = [
    .init(id: 1, overview: "Al ver que la vida en la Tierra está llegando a su fin, un grupo de exploradores dirigidos por el piloto Cooper (McConaughey) y la científica Amelia (Hathaway) emprende una misión que puede ser la más importante de la historia de la humanidad: viajar más allá de nuestra galaxia para descubrir algún planeta en otra que pueda garantizar el futuro de la raza humana.", popularity: 100.0, poster_path: "https://m.media-amazon.com/images/I/51UYbs7t0sL._AC_UF1000,1000_QL80_.jpg", title: "Interstellar", vote_average: 9.0),
    .init(id: 2, overview: "América, años 40. Don Vito Corleone (Marlon Brando) es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York. Tiene cuatro hijos: Connie (Talia Shire), el impulsivo Sonny (James Caan), el pusilánime Fredo (John Cazale) y Michael (Al Pacino), que no quiere saber nada de los negocios de su padre. Cuando Corleone, en contra de los consejos de 'Il consigliere' Tom Hagen (Robert Duvall), se niega a participar en el negocio de las drogas, el jefe de otra banda ordena su asesinato. Empieza entonces una violenta y cruenta guerra entre las familias mafiosas.", popularity: 100.0, poster_path: "/poster-de-el-padrino.jpg", title: "El Padrino", vote_average: 9.0),
    .init(id: 3, overview: "La memoria de Leonard, un investigador de una agencia de seguros, está irreversiblemente dañada debido a un golpe sufrido en la cabeza cuando intentaba evitar el asesinato de su mujer: éste es el último hecho que recuerda del pasado. La memoria reciente la ha perdido: los hechos cotidianos desaparecen de su mente en unos minutos. Así pues, para investigar e intentar vengar el asesinato de su esposa tiene que recurrir a la ayuda de una cámara instantánea y a las notas tatuadas en su cuerpo.", popularity: 100.0, poster_path: "https://m.media-amazon.com/images/I/515EOVqRexL._AC_.jpg", title: "Memento", vote_average: 9.0)
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
