//
//  AppHeaderViewController.swift
//  AppStore
//
//  Created by Baris on 26.04.2023.
//

import Foundation

import UIKit
private let reuseIdentifier = "AppsHeaderViewCell"

class AppHeaderController: UICollectionViewController {
     // MARK: - Properties

    
     // MARK: - Lifecycle
     init() {
         let flowLayout = UICollectionViewFlowLayout()
         flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
         style()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension AppHeaderController{
    private func style(){
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
   
}
 // MARK: - UICollectionViewDataSource
extension AppHeaderController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppHeaderCell
        return cell
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension AppHeaderController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 40, height: view.frame.height)
    }
  
}
