//
//  MovieDetailView.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI
import WebKit

struct MovieDetailView: View {
    let movie: Movie
    let posterURL: URL?
    @StateObject private var viewModel = MovieDetailsViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                TrailerHeaderView(trailerKey: viewModel.trailerKey)
                HStack {
                    Text("📅 \(movie.releaseDate ?? "")")
                    Spacer()
                    Text("⭐️ \(String(format: "%.1f", movie.voteAverage))")
                        .fontWeight(.bold)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal)

                Text(movie.overview ?? "")
                    .font(.body)
                    .padding(.horizontal)
                Spacer()
            }
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchMovieDetail(movieID: movie.id)
        }
    }
}
