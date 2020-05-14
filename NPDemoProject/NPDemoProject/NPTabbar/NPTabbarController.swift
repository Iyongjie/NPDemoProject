//
//  NPTabbarController.swift
//  NPDemoProject
//
//  Created by 李永杰 on 2020/4/2.
//  Copyright © 2020 NewPath. All rights reserved.
//

import UIKit
import CYLTabBarController
import NPHome
import NPMine
import URLNavigator
import SwiftTheme
import NPBaseKit

let CYLTabBarControllerHeight: CGFloat = IS_X_LATER ? 83.0 : 49.0

class NPTabbarController: CYLTabBarController {
 
    static func initWithContext() -> NPTabbarController {
        let tabBarVC = NPTabbarController(viewControllers: NPTabbarController.viewControllers(), tabBarItemsAttributes: NPTabbarController.tabBarItemsAttributesForController())
        tabBarVC.customizeTabBarAppearance()
        return tabBarVC
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func viewControllers() -> [UINavigationController]{
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let home = NPNavigationController(rootViewController: NPHomeViewController(navigator: app.navigator!))
        let mine = NPNavigationController(rootViewController: NPMineViewController(navigator: app.navigator!))
        let viewControllers = [home, mine]
        return viewControllers
    }
    
    static func tabBarItemsAttributesForController() ->  [[String : String]] {
        
        let tabBarItemHome = [CYLTabBarItemTitle:"首页",
                             CYLTabBarItemImage:"shouye",
                             CYLTabBarItemSelectedImage:"shouye"]
        let tabBarItemMine = [CYLTabBarItemTitle:"我的",
                              CYLTabBarItemImage:"shouye",
                              CYLTabBarItemSelectedImage:"shouye"]
        let tabBarItemsAttributes = [tabBarItemHome, tabBarItemMine]
        return tabBarItemsAttributes
    }
    
    func customizeTabBarAppearance() {
        self.tabBarHeight = CYLTabBarControllerHeight
        self.tabBar.theme_backgroundColor = "Tabbar.backgroundColor"
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13, *) {
            let currentUserInterfaceStyle = UITraitCollection.current.userInterfaceStyle
            guard currentUserInterfaceStyle != previousTraitCollection?.userInterfaceStyle else {
                return
            }
            let color = UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    NPThemes.switchTo(.night)
                    print("监听--暗黑模式")
                    return .black
                } else {
                    NPThemes.switchTo(.normal)
                    print("监听--正常模式")
                    return .white
                }
            }
            self.view.backgroundColor = color
        } else {
            print("不是iOS 13 ，不用适配暗黑模式")
        }
    }
}
