//
//  MoviesApiService.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import Foundation


class PopularMoviesService {
    static let shared = PopularMoviesService()
    var popularMovies: [PopularMovies] = []

    func fetchPopularMovies() -> [PopularMovies] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\("api")") else { return [] }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { movies, httpResponse, error in
            guard let data = movies, error == nil else { return }
            do {
                let results = try JSONDecoder().decode(PopularMovies.self, from: data)
                self.popularMovies.append(results)
                print("Movies: \(results)")
            } catch {
                print("Fetching failed with error: \(error.localizedDescription)")
            }
        }.resume()

        return popularMovies
    }
}
