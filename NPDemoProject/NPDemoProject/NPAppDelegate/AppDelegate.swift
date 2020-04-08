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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainTabBarVC = NPTabbarController.initWithContext()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainTabBarVC
        self.window?.makeKeyAndVisible()
          
        configNetwork()
        
        return true
    }

    
    func configNetwork() {
        Network.Configuration.default.timeoutInterval = 20
        let indicatorPlugin = NetworkIndicatorPlugin()
        Network.Configuration.default.plugins = [indicatorPlugin]

    }
}

