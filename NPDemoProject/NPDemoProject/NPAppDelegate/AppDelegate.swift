//
//  AppDelegate.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/3/11.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let mainTabBarVC = NPTabbarController(context: "")
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainTabBarVC
        self.window?.makeKeyAndVisible()
        
        print(IOS9_OR_LATER)
        return true
    }

}

