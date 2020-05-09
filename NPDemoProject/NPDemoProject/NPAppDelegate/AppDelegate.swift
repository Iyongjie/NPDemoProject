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
import Reachability
import RxSwift
import RxCocoa
import IQKeyboardManagerSwift
import SwiftTheme

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigator: NavigatorType?
    var reachability: Reachability?

    let disposeBag = DisposeBag()
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        configRouter()
        configRootVC()
        configNetwork()
        configDebug()
        configTheme()
        return true
    }
    
    func configDebug() {
        #if DEBUG
        CocoaDebug.enable()
//        Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
//        
//        @objc func injected(){
//
//            self.testButton.layoutButton(.bottom, 10)
//        }
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
    
    func configTheme() {
        
//        UIApplication.shared.theme_setStatusBarStyle("UIStatusBarStyle", animated: true)
        
        if #available(iOS 13, *) {
            let style = UITraitCollection.current.userInterfaceStyle
            if style == .dark {
                print("当前为暗黑模式")
                ThemeManager.setTheme(jsonName: "dark_theme", path: .mainBundle)
            } else {
                print("当前为正常模式")
                ThemeManager.setTheme(jsonName: "normal_theme", path: .mainBundle)
            }
        } else {
            print("不是iOS 13 ，不用适配暗黑模式")
        }
    }
}

