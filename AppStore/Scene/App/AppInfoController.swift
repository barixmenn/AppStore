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
    var results: [Results] = []{
            didSet{ collectionView.reloadData() }
        }
    
    let appID: String
    
    //MARK: - Lifecycle
    init(id:String) {
         self.appID = id
         super.init(collectionViewLayout: UICollectionViewFlowLayout())
         fetchData(id: appID)
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
// MARK: - Service
extension AppInfoController{
   private func fetchData(id: String){
       searchService.fetchDataID(id: id) { result in
           self.results = result
       }
   }
 
}

//MARK: - Helper
extension AppInfoController {
    private func style() {
        self.navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppInfoHeaderCell.self, forCellWithReuseIdentifier: reuseHeaderIdentifier)
    }
    
    private func layout() {
        
    }
}

//MARK: - UICollectionViewDataSource
extension AppInfoController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as! AppInfoHeaderCell
        cell.result = results[indexPath.row]
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension AppInfoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
