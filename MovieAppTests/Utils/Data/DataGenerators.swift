//
//  DataGenerators.swift
//  MovieAppTests
//
//  Created by Gómez Gruss Pablo on 9/8/23.
//

import Foundation
@testable import MovieApp

func getMoviesDataExample() -> [Movie] {
    return [
        .init(id: 1, overview: "Al ver que la vida en la Tierra está llegando a su fin, un grupo de exploradores dirigidos por el piloto Cooper (McConaughey) y la científica Amelia (Hathaway) emprende una misión que puede ser la más importante de la historia de la humanidad: viajar más allá de nuestra galaxia para descubrir algún planeta en otra que pueda garantizar el futuro de la raza humana.", popularity: 100.0, poster_path: "https://m.media-amazon.com/images/I/51UYbs7t0sL._AC_UF1000,1000_QL80_.jpg", title: "Interstellar", vote_average: 9.0, release_date: "2023-08-02"),
        .init(id: 2, overview: "América, años 40. Don Vito Corleone (Marlon Brando) es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York. Tiene cuatro hijos: Connie (Talia Shire), el impulsivo Sonny (James Caan), el pusilánime Fredo (John Cazale) y Michael (Al Pacino), que no quiere saber nada de los negocios de su padre. Cuando Corleone, en contra de los consejos de 'Il consigliere' Tom Hagen (Robert Duvall), se niega a participar en el negocio de las drogas, el jefe de otra banda ordena su asesinato. Empieza entonces una violenta y cruenta guerra entre las familias mafiosas.", popularity: 10.0, poster_path: "/poster-de-el-padrino.jpg", title: "El Padrino", vote_average: 8.0, release_date: "2020-08-02"),
        .init(id: 3, overview: "La memoria de Leonard, un investigador de una agencia de seguros, está irreversiblemente dañada debido a un golpe sufrido en la cabeza cuando intentaba evitar el asesinato de su mujer: éste es el último hecho que recuerda del pasado. La memoria reciente la ha perdido: los hechos cotidianos desaparecen de su mente en unos minutos. Así pues, para investigar e intentar vengar el asesinato de su esposa tiene que recurrir a la ayuda de una cámara instantánea y a las notas tatuadas en su cuerpo.", popularity: 90.0, poster_path: "https://m.media-amazon.com/images/I/515EOVqRexL._AC_.jpg", title: "Memento", vote_average: 4.0, release_date: "2016-08-02")
    ]
}

func getCastDataExample() -> [Actor] {
    return [
        .init(id: 1, name: "Margot Robie", profile_path: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"),
        .init(id: 2, name: "Margot Robie", profile_path: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"),
        .init(id: 3, name: "Margot Robie", profile_path: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"),
        .init(id: 4, name: "Margot Robie", profile_path: "https://image.tmdb.org/t/p/w500/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg"),
        
    ]
}

func getPlatformsDataExample() -> [Platform] {
    return [
        .init(provider_id: 1, logo_path: "https://image.tmdb.org/t/p/w500/peURlLlr8jggOwK53fJ5wdQl05y.jpg", provider_name: "Apple TV"),
        .init(provider_id: 2, logo_path: "https://image.tmdb.org/t/p/w500/uOTEObCZtolNGDA7A4Wrb47cxNn.jpg", provider_name: "Amazon Video"),
        .init(provider_id: 3, logo_path: "https://image.tmdb.org/t/p/w500/t2yyOv40HZeVlLjYsCsPHnWLk4W.jpg", provider_name: "Movistar Play")
    ]
}
