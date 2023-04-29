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
    private var startLocation: CGRect?
    var todayDetailViewController = TodayDetailCellController()
    
    //MARK: - Life Cycle
     init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
         setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          self.navigationController?.navigationBar.isHidden = true
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

// MARK: - selector
extension TodayViewController{
   @objc private func handleTodayDetailViewController(_ sender: UITapGestureRecognizer){
       UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8) {
           self.todayDetailViewController.view.frame = self.startLocation ?? .zero
           self.tabBarController?.tabBar.alpha = 1
       } completion: { _ in
           self.todayDetailViewController.removeFromParent()
           self.todayDetailViewController.view.removeFromSuperview()
        
       }

   }
}

//MARK: - CollectionViewDataSource
extension TodayViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}

//MARK: - CollectionViewDelegate
extension TodayViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let item = collectionView.cellForItem(at: indexPath)
           self.startLocation = item?.superview?.convert(item?.frame ?? .zero, to: nil)
           todayDetailViewController.view.frame = startLocation ?? .zero
           //todayDetailViewController.today = self.todayModelResult[indexPath.row]
           self.todayDetailViewController.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTodayDetailViewController)))
           addChild(todayDetailViewController)
           view.addSubview(todayDetailViewController.view)
           UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8) {
               self.todayDetailViewController.view.frame = self.view.frame
               self.tabBarController?.tabBar.alpha = 0
           } completion: { _ in
               
           }

           
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

