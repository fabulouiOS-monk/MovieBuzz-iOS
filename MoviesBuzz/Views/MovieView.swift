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

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: posterURL) { img in
                img.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 90, height: 135)
            .clipShape(RoundedRectangle(cornerRadius: 8))

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
        .padding(.vertical, 8)
    }
}

//#Preview {
//    MovieView()
//}
