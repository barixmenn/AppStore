//
//  TodayCell.swift
//  AppStore
//
//  Created by Baris on 29.04.2023.
//

import UIKit

class TodayCell : UICollectionViewCell {
//MARK: - UI ELements
    private let detailImageView: UIImageView = {
         let imageView =  UIImageView()
         imageView.customMode()
         imageView.layer.cornerRadius = 14
        imageView.backgroundColor = .purple
         return imageView
     }()
    
    private let featureTitleLabel: UILabel = {
           let label = UILabel()
            label.textColor = .darkGray
            label.font = UIFont.boldSystemFont(ofSize: 18)
            return label
        }()
        private let titleLabel: UILabel = {
           let label = UILabel()
            label.textColor = .darkGray
            label.font = UIFont.boldSystemFont(ofSize: 25)
            return label
        }()
        private var labelStackView: UIStackView!
    
//MARK: - Properteis
    var today: Today?{
           didSet{
               configure()
           }
       }
    
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

// MARK: - Helpers
extension TodayCell{
   private func style(){
       backgroundColor = .white
       layer.cornerRadius = 14
       detailImageView.translatesAutoresizingMaskIntoConstraints = false
       titleLabel.translatesAutoresizingMaskIntoConstraints = false
       labelStackView = UIStackView(arrangedSubviews: [featureTitleLabel,titleLabel])
       labelStackView.axis = .vertical
       labelStackView.spacing = 4
       labelStackView.translatesAutoresizingMaskIntoConstraints = false
   }
   private func layout(){
       addSubview(detailImageView)
       addSubview(labelStackView)
       NSLayoutConstraint.activate([
           detailImageView.topAnchor.constraint(equalTo: topAnchor),
           detailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
           detailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
           detailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
           labelStackView.topAnchor.constraint(equalTo: topAnchor,constant: 8),
           labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
           labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
       ])
   }
   private func configure(){
       guard let today = self.today else { return }
       self.featureTitleLabel.text = today.featuredTitle
       self.titleLabel.text = today.headTitle
       self.detailImageView.image = UIImage(named: today.imageName)
   }
}
