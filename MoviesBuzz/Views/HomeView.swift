//
//  HomeView.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = PopularMoviesViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.popularMovies) { movie in
                NavigationLink {
                    MovieDetailView(
                        movie: movie,
                        posterURL: URL(string: "\(APIConstants.imageHostUrl)\(movie.posterPath ?? "")")
                    )
                } label: {
                    MovieView(
                        posterURL: URL(string: "\(APIConstants.imageHostUrl)\(movie.posterPath ?? "")"),
                        movie: movie
                    )
                }
            }
            .navigationTitle("Popular Movies")
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}

#Preview {
    HomeView()
}
