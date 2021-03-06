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
        configBasic()
        configTheme()
        configRouter()
        configRootVC()
        configNetwork()
        configDebug()
        return true
    }
    
    func configBasic() {
        // 键盘自动隐藏
        IQKeyboardManager.shared.enable = true
        // 防止暴力点击，如果不需要，可设置间隔为0.1
        UIButton.initializeOnceMethod()
    }
    
    func configDebug() {
        #if DEBUG
        CocoaDebug.enable()
        // 模拟器热重载
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
        
        // 添加请求头
//        Network.Configuration.default.addingHeaders = { target in
//            if target.path.contains("user") { return ["userId": "123456789"] }
//            return [:]
//        }
        print(wifiIP())
        print(deviceIP())
        
    }
    
    func configRouter() {
        let navigator = Navigator()
        self.navigator = navigator
        // 初始化模块导航
        NavigationMap.initialize(navigator: navigator)
    }
    
    func configTheme() {

        if #available(iOS 13, *) {
            let style = UITraitCollection.current.userInterfaceStyle
            if style == .dark {
                NPThemes.switchTo(.night)
            } else {
                NPThemes.switchTo(.normal)
            }
        } else {
            NPThemes.switchTo(.normal)
            print("不是iOS 13 ，不用适配暗黑模式")
        }
        UIApplication.shared.theme_setStatusBarStyle("UIStatusBarStyle", animated: true)

    }
}

