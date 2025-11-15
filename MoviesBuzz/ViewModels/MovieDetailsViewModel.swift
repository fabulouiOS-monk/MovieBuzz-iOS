//
//  MovieDetailsViewModel.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI
import Combine

class MovieDetailsViewModel: ObservableObject {
    @Published var movieDetails: MovieDetails?
    @Published var isLoading: Bool = false
    @Published var trailerKey: String? = nil
    
    init(movieDetails: MovieDetails? = nil) {
        self.movieDetails = movieDetails
    }

    func fetchMovieDetail(movieID: Int) async {
        do {
            let details = try await MoviesService.shared.fetchMovieDetails(movieId: movieID)
            movieDetails = details
            trailerKey = details?.videos?.results.first(where: { $0.site == "YouTube" && $0.type == "Trailer" })?.key
        } catch {
            print("Error:", error)
        }
    }
}
