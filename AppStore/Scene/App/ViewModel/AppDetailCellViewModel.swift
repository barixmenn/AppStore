//
//  AppDetailCellViewModel.swift
//  AppStore
//
//  Created by Baris on 26.04.2023.
//

import Foundation

struct AppDetailCellViewModel {
    let result: FeedResult
    init(result: FeedResult) {
        self.result = result
    }
    var appImageUrl: URL?{
        return URL(string: result.artworkUrl100)
    }
    var artistName: String?{
        return result.artistName
    }
    var name: String?{
        return result.name
    }
}
