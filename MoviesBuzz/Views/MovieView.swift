//
//  MovieView.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI

struct MovieView: View {
    let posterURL: URL?
    let movie: Movie
    @EnvironmentObject var favouriteManager: FavoritesManager

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            imageView()
            movieOverview()
        }
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private func imageView() -> some View {
        AsyncImage(url: posterURL) { img in
            img.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Color.gray.opacity(0.3)
        }
        .frame(minWidth: 90, minHeight: 135)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(alignment: .topLeading) {
            favButtonView()
                .padding([.leading, .top], 5)
        }
    }

    @ViewBuilder
    private func movieOverview() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(movie.title)
                .font(.headline)
            Text(movie.overview ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
            HStack {
                Text("📅 \(movie.releaseDate ?? "")")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text("⭐️ \(String(format: "%.1f", movie.voteAverage))")
                    .font(.caption.bold())
                    .foregroundColor(.yellow)
            }
        }
    }

    @ViewBuilder
    private func favButtonView() -> some View {
        Button {
            favouriteManager.toggleFavorite(movieId: movie.id)
        } label: {
            Image(systemName: favouriteManager.isFavorite(movieId: movie.id)
                  ? "heart.fill" : "heart")
                .font(.system(size: 18))
                .padding(6)
                .background(.white)
                .clipShape(Circle())
                .foregroundColor(favouriteManager.isFavorite(movieId: movie.id)
                                 ? .red : .black)
        }
        .buttonStyle(.plain)
    }
}

//#Preview {
//    MovieView()
//}
