//
//  PopularMoviesViewModel.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI
import Combine

class PopularMoviesViewModel: ObservableObject {
    @Published var popularMovies: [Movie]
    @Published var isLoading: Bool = false
    
    init(popularMovies: [Movie] = []) {
        self.popularMovies = popularMovies
    }

    func fetchMovies() async {
        isLoading = true
        defer { isLoading = false }

        do {
            let movies = try await MoviesService.shared.fetchPopularMovies()
            popularMovies = movies
        } catch {
            print("Error:", error)
        }
    }
}
