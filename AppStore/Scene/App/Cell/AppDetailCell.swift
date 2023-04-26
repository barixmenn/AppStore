//
//  AppDetailCell.swift
//  AppStore
//
//  Created by Baris on 25.04.2023.
//

import UIKit
import Kingfisher

class AppDetailCell : UICollectionViewCell {
    
    //MARK: - UI Elements
    private let appIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    private let firmLabel: UILabel = {
        let label = UILabel()
        label.text = "Firm Label"
        return label
    }()
    private lazy var getButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.88, alpha: 1)
        button.layer.cornerRadius = 34 / 2
        return button
    }()
    var labelStackView: UIStackView!
    var fullStackView: UIStackView!
    
    //MARK: - Properties
     var result: FeedResult?{
        didSet { configure() }
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

//MARK: - Helper
extension AppDetailCell {
    private func style() {
        labelStackView = UIStackView(arrangedSubviews: [nameLabel,firmLabel])
        labelStackView.axis = .vertical
        fullStackView = UIStackView(arrangedSubviews: [appIcon,labelStackView,getButton])
        fullStackView.axis = .horizontal
        fullStackView.alignment = .center
        fullStackView.spacing = 8
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    private func layout() {
        addSubview(fullStackView)
        NSLayoutConstraint.activate([
            appIcon.widthAnchor.constraint(equalToConstant: 80),
            appIcon.heightAnchor.constraint(equalToConstant: 65),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 34),
            fullStackView.topAnchor.constraint(equalTo: topAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func configure() {
        guard let result = self.result else {return}
        let viewModel = AppDetailCellViewModel(result: result)
        self.nameLabel.text = viewModel.name
        self.firmLabel.text = viewModel.artistName
        self.appIcon.kf.setImage(with: viewModel.appImageUrl)
    }
}
