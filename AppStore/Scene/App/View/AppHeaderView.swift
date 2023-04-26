//
//  AppHeaderView.swift
//  AppStore
//
//  Created by Baris on 26.04.2023.
//


import UIKit
class AppHeaderView: UICollectionReusableView {
     // MARK: - Properties
    
    private let appsHeaderViewController = AppHeaderController()
    
    var appsHeaderResult: [AppHeaderModel] = []{
        didSet{ appsHeaderViewController.appsHeaderResult = appsHeaderResult  }
        }
    
     // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension AppHeaderView{
    private func style(){
        appsHeaderViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(appsHeaderViewController.view)
        NSLayoutConstraint.activate([
            appsHeaderViewController.view.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            appsHeaderViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            appsHeaderViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            appsHeaderViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8),
        ])
    }
}
