//
//  ScreenshotCell.swift
//  AppStore
//
//  Created by Baris on 28.04.2023.
//

import Foundation
import UIKit

class ScreenshotCell: UICollectionViewCell {
    //MARK: - UI Elemetns
    private let previewLabel: UILabel = {
       let label = UILabel()
        label.text = "Preview"
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
     // MARK: - Properties
    var resultImage : [String] = [] {
        didSet { screenshotCellViewController.resultsImage = resultImage }
    }
    private let screenshotCellViewController = ScreenShotCellViewController()
     // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func setup(){
        style()
        layout()
    }
}
extension ScreenshotCell{
    private func style(){
        previewLabel.translatesAutoresizingMaskIntoConstraints = false
        screenshotCellViewController.view.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        addSubview(previewLabel)
        addSubview(screenshotCellViewController.view)
        NSLayoutConstraint.activate([
            previewLabel.topAnchor.constraint(equalTo: topAnchor),
            previewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            previewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenshotCellViewController.view.topAnchor.constraint(equalTo: previewLabel.bottomAnchor),
            screenshotCellViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            screenshotCellViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            screenshotCellViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
