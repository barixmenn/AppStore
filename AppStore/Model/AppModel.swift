//
//  AppModel.swift
//  AppStore
//
//  Created by Baris on 26.04.2023.
//

import Foundation

struct AppModel: Codable {
    let feed: Feed
}
struct Feed: Codable {
    let title: String
    let results: [FeedResult]
}
struct FeedResult: Codable {
    let name: String
    let artistName: String
    let artworkUrl100: String
    let id: String
}
