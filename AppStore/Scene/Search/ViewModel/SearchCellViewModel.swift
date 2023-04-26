//
//  SearchCellViewModel.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import Foundation
import Kingfisher

class SearchCellViewModel {
    
    //MARK: - Properties
    let result : Results
    
    //MARK: - Lifecycle
    init(result: Results) {
        self.result = result
    }
    
    
    //MARK: - Helpers
    var nameLabel : String {
        return result.trackName
    }
    
    var ratingLabel : String {
        return String(format: "%.2f", result.averageUserRating ?? 0)
    }
    
    var categoryLabel : String {
        return result.primaryGenreName
    }
    
    var appIcon : URL? {
        return URL(string: result.artworkUrl100)
    }
    
    var screenPhoto1 : URL? {
        return URL(string: result.screenshotUrls[0])
    }
    
    var screenPhoto2 : URL? {
        return URL(string: result.screenshotUrls[1])
    }
    var screenPhoto3 : URL? {
        return URL(string: result.screenshotUrls[2])
    }
    
    
}
