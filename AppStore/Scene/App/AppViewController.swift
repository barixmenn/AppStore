//
//  AppViewController.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//


import UIKit

private let reuseIdentifier = "appCell"
private let reuseHeaderIdentifier = "headerCell"

class AppViewController: UICollectionViewController {
    //MARK: - UI Elements
  
    //MARK: - Properties
    private var feedArray : [Feed] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
     private var appsHeaderResult: [AppHeaderModel] = []
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
        fetchDatailData()

    }
    
    //MARK: - Actions
    
}

// MARK: - Service
extension AppViewController{
    private func fetchDatailData(){
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        AppService.fetchData(urlString: URL_TOPFREE ) { feed in
            dispatchGroup.leave()
            self.feedArray.append(feed)
        }
        dispatchGroup.enter()
        AppService.fetchData(urlString: URL_TOPPAID) { feed in
            dispatchGroup.leave()
            self.feedArray.append(feed)
        }
        dispatchGroup.enter()
        AppService.fetchHeaderData(urlString: URL_HEADER) { result in
            dispatchGroup.leave()
            self.appsHeaderResult = result
        }
        dispatchGroup.notify(queue: .main) {
            self.collectionView.reloadData()
        }
    }
}

//MARK: - Helpers
extension AppViewController {
    private func style() {
        collectionView.register(AppCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(AppHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeaderIdentifier)
    }
    
    private func layout() {

    }
}



//MARK: - CollectionView Extensions
extension AppViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppCell
        cell.feed = feedArray[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeaderIdentifier, for: indexPath) as! AppHeaderView
        header.appsHeaderResult = self.appsHeaderResult
          
           return header
       }
}

extension AppViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 10, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return .init(width: view.frame.width, height: 250)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 10, bottom: 0, right: 0)
    }
}


//MARK:  -AppViewController
extension AppViewController : AppCellProtocol {
    func goAppInfoViewController(id: String) {
        print(id)
        let controller = AppInfoViewController(id: id)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
