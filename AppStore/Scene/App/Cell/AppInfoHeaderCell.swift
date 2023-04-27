//
//  AppInfoCell.swift
//  AppStore
//
//  Created by Baris on 27.04.2023.
//

import UIKit
import Kingfisher

class AppInfoHeaderCell: UICollectionViewCell {
    
     // MARK: - Properties
  
    private let appIconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        imageView.layer.cornerRadius = 13
        return imageView
    }()
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "App Name"
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    private lazy var getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.layer.cornerRadius = 12
        return button
    }()
    private let whatsNewLabel: UILabel = {
       let label = UILabel()
        label.text = "Whats New"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let releaseNotesLabel: UILabel = {
       let label = UILabel()
        label.text = "releaseNotes"
        label.numberOfLines = 0
        return label
    }()
    var headStackView: UIStackView!
    var labelButtonStackView: UIStackView!
    var labelStackView: UIStackView!
    var fullStackView: UIStackView!
    
    //MARK: - Properties
    var result: Results?{
        didSet{ ( configure()) }
    }
    
     // MARK: - Lifecycle
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
 // MARK: - Helpers
extension AppInfoHeaderCell{
    private func style(){
        labelButtonStackView = UIStackView(arrangedSubviews: [nameLabel,UIStackView(arrangedSubviews: [getButton,UIView()])])
        labelButtonStackView.axis = .vertical
        headStackView = UIStackView(arrangedSubviews: [appIconImageView,labelButtonStackView])
        headStackView.spacing = 8
        labelStackView = UIStackView(arrangedSubviews: [whatsNewLabel,releaseNotesLabel])
        labelStackView.axis = .vertical
        labelStackView.spacing = 8
        fullStackView = UIStackView(arrangedSubviews: [headStackView,labelStackView])
        fullStackView.axis = .vertical
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func layout(){
        addSubview(fullStackView)
        NSLayoutConstraint.activate([
            appIconImageView.widthAnchor.constraint(equalToConstant: 100),
            appIconImageView.heightAnchor.constraint(equalToConstant: 100),
            getButton.heightAnchor.constraint(equalToConstant: 32),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            fullStackView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configure() {
            guard let result = self.result else { return }
            let viewModel = AppInfoViewModel(result: result)
            self.nameLabel.text = viewModel.name
            self.releaseNotesLabel.text = viewModel.releaseNotes
            self.appIconImageView.kf.setImage(with: viewModel.appImageUrl)
            self.getButton.setTitle(viewModel.formattedPrice, for: .normal)
        }
}
