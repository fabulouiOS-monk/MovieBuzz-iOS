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
    @Published var someError: String = ""
    @Published var searchText = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(popularMovies: [Movie] = []) {
        self.popularMovies = popularMovies
        $searchText
            .debounce(for: .milliseconds(350), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                Task {
                    await self?.searchMovies(query: query)
                }
            }.store(in: &cancellables)
    }

    func fetchMovies() async {
        do {
            let movies = try await MoviesService.shared.fetchPopularMovies()
            popularMovies = movies
        } catch {
            someError = "Facing network error"
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
