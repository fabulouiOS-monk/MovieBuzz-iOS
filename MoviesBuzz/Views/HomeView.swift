//
//  HomeView.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Movies")
                .font(.system(size: 50, weight: .bold))
            List {
                
            }
        }.padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
