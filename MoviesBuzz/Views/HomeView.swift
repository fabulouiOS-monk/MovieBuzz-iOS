//
//  HomeView.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: PopularMoviesViewModel
    @EnvironmentObject var favouritesManager: FavoritesManager
    @State private var searchQuery: String = ""

    var body: some View {
        NavigationStack {
            List(viewModel.popularMovies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieView(
                        posterURL: URL(string: "\(APIConstants.imageHostUrl)\(movie.posterPath ?? "")"),
                        movie: movie)
                }
                .listStyle(.plain)
                .buttonStyle(.plain)
            }
            .navigationTitle("Popular Movies")
            .searchable(text: $searchQuery, prompt: "Search movies")
            .onChange(of: searchQuery) { query in
                Task { await viewModel.searchMovies(query: query) }
            }
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

//#Preview {
//    HomeView()
//}
