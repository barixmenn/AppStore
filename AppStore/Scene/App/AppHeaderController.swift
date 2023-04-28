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
    
    var appsHeaderResult: [AppHeaderModel] = []{
        didSet{ collectionView.reloadData() }
    }
    
    // MARK: - Lifecycle
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: flowLayout)
        setup()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Functions
    private func setup() {
        style()
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
        return self.appsHeaderResult.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppHeaderCell
        cell.appHeaderModel = self.appsHeaderResult[indexPath.row]
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension AppHeaderController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 40, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }
    
}
