//
//  AppDelegate.swift
//  vip
//
//  Created by C330593 on 25/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let titlesViewController = TitlesViewController()
        let navigationController = UINavigationController(rootViewController: titlesViewController)
        
        TitlesConfigurator.configureModule(viewController: titlesViewController)
        
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

