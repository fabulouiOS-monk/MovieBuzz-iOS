//
//  PopularMoviesModel.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import Foundation

/**
 1) Movies List Page (Home)
 - Show each movie’s Title, Duration, Rating, Poster.
 - Data:
   - Popular: https://api.themoviedb.org/3/movie/popular?api_key={API_KEY}
 */

struct Movie: Identifiable, Codable {
    let id: Int
    let originalTitle: String?
    let posterPath: String?
    let overview: String?
    let releaseDate: String?
    let title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, overview, title
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

struct PopularMovies: Codable {
    let results: [Movie]
}
