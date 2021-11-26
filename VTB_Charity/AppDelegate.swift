//
//  AppDelegate.swift
//  VTB_Charity
//
//  Created by Ivan on 20.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        return true
    }
    
    func setRootViewController () {
        
        let hasPassword = Preferences.hasPassword
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        var vc: UIViewController {
            storyboard.instantiateViewController(withIdentifier: hasPassword ? "menuID" : "registration")
        }
        
        let navigationController = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
    
}

