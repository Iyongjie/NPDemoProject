//
//  AppDelegate.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/4/2.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import NPBaseKit
import NPHome
import URLNavigator
import CocoaDebug

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigator: NavigatorType?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configRouter()
        configRootVC()
        configNetwork()
        configDebug()
        return true
    }
    
    func configDebug() {
        #if DEBUG
        CocoaDebug.enable()
        #endif
    }

    func configRootVC() {
        let mainTabBarVC = NPTabbarController.initWithContext()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainTabBarVC
        self.window?.makeKeyAndVisible()
    }
    
    func configNetwork() {
        Network.Configuration.default.timeoutInterval = 20
        let indicatorPlugin = NetworkIndicatorPlugin()
        Network.Configuration.default.plugins = [indicatorPlugin]
    }
    
    func configRouter() {
        let navigator = Navigator()
        self.navigator = navigator
        // Initialize navigation map
        NavigationMap.initialize(navigator: navigator)

    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        // Try presenting the URL first
        if self.navigator?.present(url, wrap: UINavigationController.self) != nil {
            print("[Navigator] present: \(url)")
            return true
        }
        
        // Try opening the URL
        if self.navigator?.open(url) == true {
            print("[Navigator] open: \(url)")
            return true
        }
        
        return false
    }
}

