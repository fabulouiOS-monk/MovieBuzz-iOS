//
//  FavouriteMoviesView.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI

struct FavouriteMoviesView: View {
    @ObservedObject var viewModel: PopularMoviesViewModel
    @EnvironmentObject var favouriteManagers: FavoritesManager

    var body: some View {
        NavigationStack {
            if viewModel.favouriteMovies.count > 0 {
                List(viewModel.favouriteMovies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieView(
                            posterURL: URL(string: "\(APIConstants.imageHostUrl)\(movie.posterPath ?? "")"),
                            movie: movie)
                    }
                    .listStyle(.plain)
                    .buttonStyle(.plain)
                }
                .navigationTitle("Favourite Movies")
                .onChange(of: favouriteManagers.favoriteMovieIDs, { oldValue, newValue in
                    viewModel.filterFavouriteMovies(favourite: favouriteManagers)
                })
            } else {
                emptyFavouriteView()
            }
        }.onAppear {
            viewModel.filterFavouriteMovies(favourite: favouriteManagers)
        }
    }

    @ViewBuilder
    private func emptyFavouriteView() -> some View {
        VStack {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.horizontal, 100)
                .foregroundStyle(Color.gray)
            Text("You Don't have any favourites.\nMark your favourite movies and see them here!")
                .fontWeight(.light)
                .font(.system(.callout))
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
        }
    }
}

//#Preview {
//    FavouriteMoviesView()
//}
