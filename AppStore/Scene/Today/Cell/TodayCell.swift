//
//  TodayCell.swift
//  AppStore
//
//  Created by Baris on 29.04.2023.
//

import UIKit

class TodayCell : UICollectionViewCell {
//MARK: - UI ELements
    
//MARK: - Properteis
    
//MARK: - Lifecycle
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
extension TodayCell {
    private func style() {
        backgroundColor = .gray
        layer.cornerRadius = 12 
    }
    
    private func layout() {
        
    }
}
