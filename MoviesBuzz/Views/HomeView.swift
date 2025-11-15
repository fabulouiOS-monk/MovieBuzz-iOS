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
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

//#Preview {
//    HomeView()
//}
