//
//  AppDelegate.swift
//  AppStore
//
//  Created by Baris on 24.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = createTabBarController(rootViewController: MainTabBarController())
        return true
    }
    
    fileprivate func createTabBarController(rootViewController: UITabBarController)-> UITabBarController{
           let appearance = UITabBarAppearance()
           appearance.configureWithDefaultBackground()
           rootViewController.tabBar.standardAppearance = appearance
           rootViewController.tabBar.scrollEdgeAppearance = appearance
           return rootViewController
       }

}

