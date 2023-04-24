//
//  SearchViewController.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import UIKit

class SearchViewController: UIViewController {
    //MARK: - UI Elements
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
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
extension SearchViewController {
    private func style() {
        view.backgroundColor = .gray
    }
    
    private func layout() {
        
    }
}
