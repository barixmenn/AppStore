//
//  AppDetailCell.swift
//  AppStore
//
//  Created by Baris on 25.04.2023.
//

import UIKit
import Kingfisher

protocol AppDetailCellProtocol : AnyObject {
    func goAppInfoViewController(id: String)
}

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
        label.font = UIFont.systemFont(ofSize: 17)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let firmLabel: UILabel = {
        let label = UILabel()
        label.text = "Firm Label"
        label.font = UIFont.systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private lazy var getButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.88, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    var labelStackView: UIStackView!
    var fullStackView: UIStackView!
    
    //MARK: - Properties
     var result: FeedResult?{
        didSet { configure() }
    }
    weak var delegate : AppDetailCellProtocol?
    
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

// MARK: - Selectors
extension AppDetailCell{
   @objc private func handleSelf(){
       delegate?.goAppInfoViewController(id: result?.id ?? "")
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
        fullStackView.spacing = 9
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSelf))
        self.addGestureRecognizer(tapGesture)
    }
    
    private func layout() {
        addSubview(fullStackView)
        NSLayoutConstraint.activate([
            appIcon.widthAnchor.constraint(equalToConstant: 65),
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
