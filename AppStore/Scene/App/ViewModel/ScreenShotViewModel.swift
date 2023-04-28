//
//  ScreenShootViewModel.swift
//  AppStore
//
//  Created by Baris on 28.04.2023.
//

import Foundation

struct ScreenShotViewModel {
    let result: String
    init(result: String) {
        self.result = result
    }
    var imageUrl: URL?{
        return URL(string: result)
    }
}
