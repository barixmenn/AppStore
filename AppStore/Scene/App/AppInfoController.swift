//
//  AppInfoController.swift
//  AppStore
//
//  Created by Baris on 27.04.2023.
//

import Foundation
import UIKit

private let reuseHeaderIdentifier = "AppInfoCell"
class AppInfoController : UICollectionViewController  {
    //MARK: - UI Elements
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
     init() {
         super.init(collectionViewLayout: UICollectionViewFlowLayout())
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

extension AppInfoController {
    private func style() {
        self.navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppInfoCell.self, forCellWithReuseIdentifier: reuseHeaderIdentifier)
    }
    
    private func layout() {
        
    }
}

//MARK: - UICollectionViewDataSource
extension AppInfoController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as! AppInfoCell
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension AppInfoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
