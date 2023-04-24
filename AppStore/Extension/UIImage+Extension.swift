//
//  UImage+Extension.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import UIKit

extension UIImageView {
    func customMode() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    func customScreenshot(){
           layer.cornerRadius = 12
           layer.borderColor = UIColor.darkGray.cgColor
           layer.borderWidth = 0.85
       }
}
