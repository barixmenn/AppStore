//
//  AppCellController.swift
//  AppStore
//
//  Created by Baris on 25.04.2023.
//

import UIKit
private let reuseIdentifier = "appCellDetail"


class AppCellController: UICollectionViewController {
     // MARK: - Properties
    
     var results : [FeedResult] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
  
     // MARK: - Lifecycle
     init() {
         let flowLayout = UICollectionViewFlowLayout()
         flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
         style()
         layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 // MARK: - Helpers
extension AppCellController{
    private func style(){
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    private func layout(){
        
    }
}
 // MARK: - UICollcetionViewDataSource
extension AppCellController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count    
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppDetailCell
        
        cell.result = self.results[indexPath.row]
        return cell
    }
}
 // MARK: - UICollectionViewDelegateFlowLayout
extension AppCellController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 30, height: (view.frame.height) / 3 - 3 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
  
   
}
