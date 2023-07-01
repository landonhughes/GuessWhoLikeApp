//
//  AppDelegate.swift
//  GuessWhoLikeApp
//
//  Created by Landon Hughes on 7/1/23.
//

import UIKit
import SCSDKLoginKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = LoginViewController()
        
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if SCSDKLoginClient.application(app, open: url, options: options) {
              return true
            }
        return false
    }

}

