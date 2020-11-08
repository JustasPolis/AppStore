//
//  SearchResult.swift
//  AppStore
//
//  Created by Justin on 2020-10-17.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}


struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Double?
    let artworkUrl100: String
    let screenshotUrls: [String]
}
