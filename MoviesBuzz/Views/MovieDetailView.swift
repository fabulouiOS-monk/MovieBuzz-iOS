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
    @EnvironmentObject var favouriteManager: FavoritesManager
    @StateObject private var viewModel = MovieDetailsViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                TrailerHeaderView(trailerKey: viewModel.trailerKey)
                HStack {
                    Text(movie.title)
                        .font(.title.bold())
                        .padding(.horizontal)
                    Button {
                        favouriteManager.toggleFavorite(movieId: movie.id)
                    } label: {
                        Image(systemName: favouriteManager.isFavorite(movieId: movie.id)
                              ? "heart.fill" : "heart")
                            .font(.system(size: 18))
                            .padding(6)
                            .foregroundColor(favouriteManager.isFavorite(movieId: movie.id)
                                             ? .red : .black)
                    }
                    .padding(6)
                }
                HStack(spacing: 16) {
                    Label(String(format: "%.1f", movie.voteAverage), systemImage: "star.fill")
                        .foregroundColor(.yellow)
                        .fontWeight(.bold)

                    if let mins = viewModel.movieDetails?.runtime {
                        Text(formatRuntime(mins))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
                Text(movie.overview ?? "")
                    .font(.body)
                    .padding(.horizontal)

                if let genres = viewModel.movieDetails?.genres, !genres.isEmpty {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Genres")
                            .font(.headline)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(viewModel.movieDetails?.genres ?? []) { genre in
                                    Text(genre.name)
                                        .font(.caption)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 6)
                                        .background(Color.gray.opacity(0.15))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .padding(.top)
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchMovieDetail(movieID: movie.id)
        }
    }

    private func formatRuntime(_ minutes: Int) -> String {
        let h = minutes / 60
        let m = minutes % 60
        return h > 0 ? "\(h)h \(m)m" : "\(m)m"
    }
}
