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
    @Published var favouriteMovies: [Movie] = []
    
    init(popularMovies: [Movie] = []) {
        self.popularMovies = popularMovies
    }

    func fetchMovies() async {
        do {
            let movies = try await MoviesService.shared.fetchPopularMovies()
            popularMovies = movies
        } catch {
            print("Error:", error)
        }
    }

    func filterFavouriteMovies(favourite: FavoritesManager) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            favouriteMovies = popularMovies.filter { favourite.isFavorite(movieId: $0.id) }
        }
    }

    func searchMovies(query: String) async {
        guard query.isEmpty == false else {
            await fetchMovies()
            return
        }
        do {
            let searchedMovies = try await MoviesService.shared.searchMovies(query: query)
            popularMovies = searchedMovies
        } catch {
            print("Search failed: \(error.localizedDescription)")
        }
    }
}
