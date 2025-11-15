//
//  MovieDetailsModel.swift
//  MoviesBuzz
//
//  Created by Kailash Bora on 15/11/25.
//

import Foundation

struct MovieDetails: Identifiable, Codable {
    let id: Int
    let runtime: Int?
    let status: String?
    let tagline: String?
    let budget: Int?
    let homepage: String?
    let genres: [Genre]?
    let videos: VideoResponse?
}

struct Genre: Identifiable, Codable {
    let id: Int
    let name: String
}

struct VideoResponse: Codable {
    let results: [Video]
}

struct Video: Codable {
    let key: String
    let name: String
    let site: String
    let type: String
}
 

