//
//  AppDelegate.swift
//  FAARM
//
//  Created by Christopher Villanueva on 3/14/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    
        UIApplication.shared.statusBarStyle = .lightContent
        
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = HomeController(collectionViewLayout: layout)
        
        
        application.statusBarStyle = .lightContent
        
        
        return true
    }

}
