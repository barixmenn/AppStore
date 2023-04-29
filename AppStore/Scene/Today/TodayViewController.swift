//
//  TodayViewController.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import UIKit

private let  reuseIdentifier = "todayCell"

class TodayViewController: UICollectionViewController {
    //MARK: - UI Elements
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
     init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
         setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    //MARK: - Functions
    private func setup() {
        style()
        layout()
    }
    
    //MARK: - Actions
    
}


//MARK: - Helpers
extension TodayViewController {
    private func style() {
        view.backgroundColor = .systemGroupedBackground
        self.collectionView.register(TodayCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    private func layout() {
        
    }
}

//MARK: - CollectionViewDelegate
extension TodayViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}


//MARK: - UICollectionViewDelegateFlowLayout

extension TodayViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width / 1.2, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

