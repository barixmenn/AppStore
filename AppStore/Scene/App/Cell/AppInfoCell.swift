//
//  AppInfoCell.swift
//  AppStore
//
//  Created by Baris on 27.04.2023.
//

import Foundation
import UIKit

class AppInfoCell : UICollectionViewCell {
    
    //MARK: - UI Elements
    //MARK: - Properties
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
    }
    
}

//MARK: - Helper
extension AppInfoCell {
    private func style() {
        backgroundColor = .red
    }
    private func layout() {
        
    }
}
