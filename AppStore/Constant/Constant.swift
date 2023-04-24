//
//  Constant.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import Foundation

enum ServiceEndPoint : String {
    case BASE_URL = "https://itunes.apple.com/search"

    static func searchEndPoint() -> String {
        "\(BASE_URL.rawValue)"
    }
    
}
