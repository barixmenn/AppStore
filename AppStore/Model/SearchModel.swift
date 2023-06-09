//
//  SearchModel.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import Foundation
struct SearchResult: Codable {
    let resultCount: Int
    let results: [Results]
}
struct Results: Codable {
    let primaryGenreName: String
    let artworkUrl100: String
    let trackName: String
    let screenshotUrls: [String]
    var averageUserRating: Float?
    var formattedPrice: String?
    let description: String
    var releaseNotes: String?
    let trackId: Int
}
