//
//  AppViewController.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//


import UIKit

private let reuseIdentifier = "appCell"

class AppViewController: UICollectionViewController {
    //MARK: - UI Elements
  
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
    }
    
    //MARK: - Actions
    
}


//MARK: - Helpers
extension AppViewController {
    private func style() {
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    private func layout() {

    }
}


//MARK: - CollectionView Extensions
extension AppViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}

extension AppViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
