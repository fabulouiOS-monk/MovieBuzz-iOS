//
//  MoviesApiService.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import Foundation

enum APIConstants {
    #warning("Don't push API key")
    static let apiKey = "****"
    static let hostUrl = "https://api.themoviedb.org/3/movie/"
    static let imageHostUrl = "https://image.tmdb.org/t/p/w500"
}

class MoviesService {
    static let shared = MoviesService()

    func fetchPopularMovies() async throws -> [Movie] {
        guard let url = URL(string: "\(APIConstants.hostUrl)popular?api_key=\(APIConstants.apiKey)") else { return [] }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard (200..<300).contains(http.statusCode) else {
            throw NSError(domain: "HTTPError", code: http.statusCode)
        }

        let moviesList = try JSONDecoder().decode(PopularMovies.self, from: data)
        return moviesList.results
    }

    func fetchMovieDetails(movieId: Int) async throws -> MovieDetails? {
        guard let detailsURL = URL(string: "\(APIConstants.hostUrl)\(movieId)?api_key=\(APIConstants.apiKey)&append_to_response=videos") else { return nil }
        var request = URLRequest(url: detailsURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let http = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard (200..<300).contains(http.statusCode) else {
            throw NSError(domain: "HTTPError", code: http.statusCode)
        }

        let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
        return movieDetails
    }
}
