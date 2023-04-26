//
//  AppHeaderCell.swift
//  AppStore
//
//  Created by Baris on 26.04.2023.
//


import UIKit


class AppHeaderCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    private let appImage: UIImageView = {
       let imageView = UIImageView()
        imageView.customMode()
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    private let firmLabel: UILabel = {
       let label = UILabel()
        label.text = "Linkedin"
        label.font = .boldSystemFont(ofSize: 19)
        label.textColor = .blue
        return label
    }()
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "init(coder:) has not been implemented init(coder:) has not been implemented"
        return label
    }()
    private var stackView: UIStackView!
    
    // MARK: - Properties
    var appHeaderModel: AppHeaderModel?{
            didSet{ configure() }
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
extension AppHeaderCell{
    private func style(){
        stackView = UIStackView(arrangedSubviews: [firmLabel,titleLabel,appImage])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        appImage.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configure(){
          guard let result = self.appHeaderModel else { return }
          let viewModel = AppHeaderViewModel(result: result)
          self.titleLabel.text = viewModel.title
          self.firmLabel.text = viewModel.name
          self.appImage.kf.setImage(with: viewModel.imageUrl)
      }
}
