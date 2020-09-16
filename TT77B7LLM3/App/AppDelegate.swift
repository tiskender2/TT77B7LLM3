//
//  AppDelegate.swift
//  TT77B7LLM3
//
//  Created by Tolga İskender on 11.09.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startVC()
        return true
    }
    fileprivate func startVC(){
        let homeVC = HomeVC()
        let navController = UINavigationController(rootViewController: homeVC)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

