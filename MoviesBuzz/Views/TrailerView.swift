//
//  TrailerView.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI

struct TrailerHeaderView: View {
    let trailerKey: String?

    var body: some View {
        ZStack {
            if let key = trailerKey {
                VideoPlayerView(videoID: key)
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 220)
                    .padding(.horizontal)
                    .overlay(
                        ProgressView()
                    )
            }
        }
        .padding(.top)
    }
}
