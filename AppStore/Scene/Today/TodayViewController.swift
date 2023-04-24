//
//  TodayViewController.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import UIKit

class TodayViewController: UIViewController {
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
extension TodayViewController {
    private func style() {
        view.backgroundColor = .yellow
    }
    
    private func layout() {
        
    }
}

