//
//  SearchCell.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import UIKit

class SearchCell: UICollectionViewCell {
    //MARK: - UI Elements
    
    private let appPhoto : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .magenta
        image.customMode()
        image.layer.cornerRadius = 12
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalToConstant: 66).isActive = true
        return image
    }()
    
    private let screenPhoto1 : UIImageView = {
        let image = UIImageView()
        image.customMode()
        image.backgroundColor = .brown
        return image
    }()
    private let screenPhoto2 : UIImageView = {
        let image = UIImageView()
        image.customMode()
        image.backgroundColor = .brown
        return image
    }()
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Twitter"
        return label
    }()
    
    private let categoryLabel : UILabel = {
        let label = UILabel()
        label.text = "Haber"
        return label
    }()
    
    private let ratingLabel : UILabel = {
        let label = UILabel()
        label.text = "1.9M"
        return label
    }()
    
    private lazy var getButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.90, alpha: 1)
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 53).isActive = true
        button.heightAnchor.constraint(equalToConstant: 33).isActive = true
        return button
    }()
    
    private var headerStackView = UIStackView()
    private var labelStackView = UIStackView()
    private var screenStackView = UIStackView()
    private var fullStackView = UIStackView()
    
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
    
    
    //MARK: - Actions
    
}


//MARK: - Helpers
extension SearchCell {
    private func style() {
        labelStackView = UIStackView(arrangedSubviews: [
         nameLabel,categoryLabel,ratingLabel
        ])
        
        labelStackView.axis = .vertical
        labelStackView.distribution = .fillEqually
        
        
        headerStackView = UIStackView(arrangedSubviews: [
            appPhoto,labelStackView, getButton
        ])
        headerStackView.spacing = 12
        headerStackView.alignment = .center
        headerStackView.axis = .horizontal
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        screenStackView = UIStackView(arrangedSubviews: [
         screenPhoto1,screenPhoto2
        ])
        
        screenStackView.axis = .horizontal
        screenStackView.distribution = .fillEqually
        screenStackView.spacing = 8
        
        fullStackView = UIStackView(arrangedSubviews: [
        headerStackView,screenStackView
        ])
        
        fullStackView.axis = .vertical
        fullStackView.spacing = 8
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func layout() {
        addSubview(fullStackView)
        
        NSLayoutConstraint.activate([
            fullStackView.topAnchor.constraint(equalTo: topAnchor),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
