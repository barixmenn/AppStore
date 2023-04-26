//
//  AppCell.swift
//  AppStore
//
//  Created by Baris on 25.04.2023.
//

import UIKit


class AppCell : UICollectionViewCell {
    
    //MARK: - UI Elements
    
    private let sectionLabel : UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.text = "Section Label"
        //label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    //MARK: - Properties
    private let appCellController = AppCellController()
    var feed:Feed?{
            didSet{ configure() }
        }
    
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

extension AppCell {
    private func style() {
    }
    
    private func layout() {
        addSubview(sectionLabel)
        addSubview(appCellController.view)
        
        sectionLabel.translatesAutoresizingMaskIntoConstraints = false
        appCellController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor,constant: 15),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // appCell
            appCellController.view.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor ,constant: 15),
            appCellController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appCellController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appCellController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    private func configure(){
          guard let feed = self.feed else { return }
          self.sectionLabel.text = feed.title
          self.appCellController.results = feed.results
      }
}
