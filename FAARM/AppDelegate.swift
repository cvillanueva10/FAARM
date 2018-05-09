//
//  AppDelegate.swift
//  FAARM
//
//  Created by Christopher Villanueva on 3/14/18.
//  Copyright © 2018 Christopher Villanueva. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    
        UIApplication.shared.statusBarStyle = .lightContent
        
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = HomeController(collectionViewLayout: layout)
        
        attemptRegisterForNotifications(application: application)
        
        application.statusBarStyle = .lightContent
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Registered for Notifications: ", deviceToken)
    }
    
    private func attemptRegisterForNotifications(application: UIApplication) {
        
        print("Notifications")
        
        // User Notifications Auth for iOS 10+ 
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (granted, error ) in
            
            if let error = error {
                print("Failed to request authorization: ", error)
                return
            }
            
            if granted {
                print("Auth granted")
                
            }
            
            
        }
        
        application.registerForRemoteNotifications()
        
        
    }

}
