//
//  MoviesBuzzApp.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI

@main
struct MoviesBuzzApp: App {
    @StateObject var favouritesManager = FavoritesManager()
    @StateObject var popularMoviesViewModel = PopularMoviesViewModel()
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView(viewModel: popularMoviesViewModel)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                FavouriteMoviesView(viewModel: popularMoviesViewModel)
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
            }
            .environmentObject(favouritesManager)
        }
    }
}
