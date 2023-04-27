//
//  AppInfoViewModel.swift
//  AppStore
//
//  Created by Baris on 28.04.2023.
//

import Foundation

struct AppInfoViewModel {
    
    let result: Results
    init(result: Results) {
        self.result = result
    }
    var name: String?{
        return result.trackName
    }
    var releaseNotes: String?{
        return result.releaseNotes
    }
    var appImageUrl: URL?{
        return URL(string: result.artworkUrl100)
    }
    var formattedPrice: String?{
        return result.formattedPrice
    }
}
